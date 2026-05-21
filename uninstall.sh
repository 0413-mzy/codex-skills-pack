#!/usr/bin/env bash
set -euo pipefail

CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
AGENTS_HOME="${AGENTS_HOME:-$HOME/.agents}"
SKILLS_DIR="${SKILLS_DIR:-$AGENTS_HOME/skills}"
SOURCE_DIR="${SOURCE_DIR:-$CODEX_HOME/community-skills}"

PACK_LINKS=(
  superpowers
  brainstorming
  dispatching-parallel-agents
  executing-plans
  finishing-a-development-branch
  receiving-code-review
  requesting-code-review
  subagent-driven-development
  systematic-debugging
  test-driven-development
  using-git-worktrees
  using-superpowers
  verification-before-completion
  writing-plans
  writing-skills
  caveman
  design-an-interface
  diagnose
  edit-article
  git-guardrails-claude-code
  grill-me
  grill-with-docs
  handoff
  improve-codebase-architecture
  migrate-to-shoehorn
  obsidian-vault
  prototype
  qa
  request-refactor-plan
  review
  scaffold-exercises
  setup-matt-pocock-skills
  setup-pre-commit
  tdd
  to-issues
  to-prd
  triage
  ubiquitous-language
  write-a-skill
  writing-beats
  writing-fragments
  writing-shape
  zoom-out
  baoyu-article-illustrator
  baoyu-comic
  baoyu-compress-image
  baoyu-cover-image
  baoyu-danger-gemini-web
  baoyu-danger-x-to-markdown
  baoyu-diagram
  baoyu-format-markdown
  baoyu-image-cards
  baoyu-image-gen
  baoyu-imagine
  baoyu-infographic
  baoyu-markdown-to-html
  baoyu-post-to-wechat
  baoyu-post-to-weibo
  baoyu-post-to-x
  baoyu-slide-deck
  baoyu-translate
  baoyu-url-to-markdown
  baoyu-wechat-summary
  baoyu-xhs-images
  baoyu-youtube-transcript
  banner-design
  brand
  design
  design-system
  slides
  ui-styling
  ui-ux-pro-max
)

FILE_SKILLS=(
  frontend-design
  markdown-to-html-skill
)

GSTACK_DIRS=(
  gstack
  gstack-office-hours
  gstack-plan-ceo-review
  gstack-plan-eng-review
  gstack-review
  gstack-ship
  gstack-upgrade
)

remove_link_or_dir() {
  local name="$1"
  local path="$SKILLS_DIR/$name"

  if [ -L "$path" ]; then
    rm "$path"
    echo "删除软链接：$name"
  elif [ -d "$path" ]; then
    rm -rf "$path"
    echo "删除目录：$name"
  fi
}

echo "卸载 codex-skills-pack skills..."

for name in "${PACK_LINKS[@]}"; do
  remove_link_or_dir "$name"
done

for name in "${FILE_SKILLS[@]}"; do
  remove_link_or_dir "$name"
done

for name in "${GSTACK_DIRS[@]}"; do
  remove_link_or_dir "$name"
done

if [ -d "$SOURCE_DIR" ]; then
  rm -rf "$SOURCE_DIR"
  echo "删除源码缓存：$SOURCE_DIR"
fi

echo ""
echo "卸载完成。请重启 Codex。"
echo "注意：gstack 可能曾更新 ~/.codex/AGENTS.md，如需完全清理，请手动删除其中 GSTACK-CODEX MANAGED BLOCK。"
