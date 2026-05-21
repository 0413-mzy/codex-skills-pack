#!/usr/bin/env bash
set -euo pipefail

PACK_NAME="codex-skills-pack"
CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
AGENTS_HOME="${AGENTS_HOME:-$HOME/.agents}"
SKILLS_DIR="${SKILLS_DIR:-$AGENTS_HOME/skills}"
SOURCE_DIR="${SOURCE_DIR:-$CODEX_HOME/community-skills}"

log() {
  printf '%s\n' "$*"
}

need_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    log "缺少命令：$1"
    log "请先安装它，然后重新运行安装脚本。"
    exit 1
  fi
}

clone_or_update() {
  local repo="$1"
  local dest="$2"

  if [ -d "$dest/.git" ]; then
    log "更新：$repo"
    git -C "$dest" pull --ff-only
  else
    log "下载：$repo"
    rm -rf "$dest"
    git clone "$repo" "$dest"
  fi
}

link_dir() {
  local source="$1"
  local name="$2"
  local dest="$SKILLS_DIR/$name"

  if [ ! -f "$source/SKILL.md" ] && [ ! -d "$source" ]; then
    log "跳过：$name，源目录不存在：$source"
    return
  fi

  if [ -L "$dest" ]; then
    rm "$dest"
  elif [ -e "$dest" ]; then
    log "跳过：$name，目标已存在且不是软链接：$dest"
    return
  fi

  ln -s "$source" "$dest"
  log "链接：$name"
}

download_skill_file() {
  local url="$1"
  local name="$2"
  local dest="$SKILLS_DIR/$name"

  mkdir -p "$dest"
  log "下载单文件 skill：$name"
  curl -fL "$url" -o "$dest/SKILL.md"
}

link_skill_children() {
  local parent="$1"
  local md
  local dir
  local name

  if [ ! -d "$parent" ]; then
    log "跳过：目录不存在：$parent"
    return
  fi

  while IFS= read -r md; do
    dir="${md%/SKILL.md}"
    name="${dir##*/}"
    link_dir "$dir" "$name"
  done < <(find "$parent" -mindepth 2 -maxdepth 2 -name SKILL.md | sort)
}

install_gstack() {
  if command -v npx >/dev/null 2>&1; then
    log "安装/更新：gstack-codex"
    npx gstack-codex init --global
  else
    log "跳过：gstack-codex 需要 npx。安装 Node.js 后可运行：npx gstack-codex init --global"
  fi
}

verify_install() {
  local total
  total="$(find -L "$SKILLS_DIR" -mindepth 2 -maxdepth 4 -name SKILL.md 2>/dev/null | wc -l | tr -d ' ')"
  log ""
  log "安装完成。当前可扫描到 $total 个 SKILL.md。"
  log "Skills 目录：$SKILLS_DIR"
  log "源码缓存：$SOURCE_DIR"
  log ""
  log "请重启 Codex，让它重新扫描新安装的 skills。"
}

main() {
  log "== $PACK_NAME =="
  log "安装目录：$SKILLS_DIR"
  log "源码缓存：$SOURCE_DIR"
  log ""

  need_cmd git
  need_cmd curl
  need_cmd find

  mkdir -p "$SKILLS_DIR" "$SOURCE_DIR"

  clone_or_update "https://github.com/obra/superpowers.git" "$SOURCE_DIR/superpowers"
  link_dir "$SOURCE_DIR/superpowers/skills" "superpowers"
  link_skill_children "$SOURCE_DIR/superpowers/skills"

  clone_or_update "https://github.com/mattpocock/skills.git" "$SOURCE_DIR/mattpocock-skills"
  link_skill_children "$SOURCE_DIR/mattpocock-skills/skills"

  clone_or_update "https://github.com/jimliu/baoyu-skills.git" "$SOURCE_DIR/baoyu-skills"
  link_skill_children "$SOURCE_DIR/baoyu-skills/skills"

  clone_or_update "https://github.com/nextlevelbuilder/ui-ux-pro-max-skill.git" "$SOURCE_DIR/ui-ux-pro-max-skill"
  link_skill_children "$SOURCE_DIR/ui-ux-pro-max-skill/.claude/skills"

  download_skill_file "https://raw.githubusercontent.com/anthropics/claude-code/main/plugins/frontend-design/skills/frontend-design/SKILL.md" "frontend-design"
  download_skill_file "https://claudskills.com/skills/markdown-to-html-skill/SKILL.md" "markdown-to-html-skill"

  install_gstack
  verify_install
}

main "$@"
