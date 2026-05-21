# Codex Skills Pack

一个给 Codex 用的社区 skills 一键安装包。

它会把一组常用 skills 安装到全局目录：

```bash
~/.agents/skills
```

安装后，新的 Codex 对话和其他项目里的 Codex 都可以使用这些 skills。安装完成后需要重启 Codex。

## 包含什么

这个安装包会安装或链接这些来源的 skills：

- Superpowers: https://github.com/obra/superpowers
- gstack-codex: https://www.npmjs.com/package/gstack-codex
- Matt Pocock skills: https://github.com/mattpocock/skills
- Baoyu skills: https://github.com/jimliu/baoyu-skills
- UI/UX Pro Max: https://github.com/nextlevelbuilder/ui-ux-pro-max-skill
- frontend-design: https://github.com/anthropics/claude-code
- markdown-to-html-skill: https://claudskills.com/skills/markdown-to-html-skill/

完整中文说明在：

```text
docs/skills-catalog.md
```

## 一键安装

如果你信任这个仓库，可以直接运行：

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/0413-mzy/codex-skills-pack/main/install.sh)"
```

如果你改了仓库名或 GitHub 用户名，也要同步修改上面的链接。

更推荐的安装方式是先 clone，再运行脚本：

```bash
git clone https://github.com/0413-mzy/codex-skills-pack.git
cd codex-skills-pack
bash install.sh
```

## 安装后怎么用

重启 Codex 后，可以直接调用：

```text
use frontend-design
```

```text
use using-superpowers
```

```text
use baoyu-markdown-to-html
```

gstack skills 用斜杠命令：

```text
/office-hours
```

```text
/review
```

```text
/ship
```

也可以不手动指定 skill，直接描述你的目标，让 Codex 自动判断。

## 更新

```bash
bash update.sh
```

它会重新运行安装流程，更新 clone 下来的上游仓库，并刷新单文件 skills。

## 卸载

```bash
bash uninstall.sh
```

卸载脚本会删除这个包创建的 symlink、单文件 skill 目录、gstack skill 目录，以及：

```bash
~/.codex/community-skills
```

注意：gstack 安装器可能会更新：

```bash
~/.codex/AGENTS.md
```

如果你想彻底清理 gstack，可以手动删除里面的 `GSTACK-CODEX MANAGED BLOCK`。

## 目录结构

```text
codex-skills-pack/
├── README.md
├── manifest.json
├── install.sh
├── update.sh
├── uninstall.sh
└── docs/
    └── skills-catalog.md
```

## 安全说明

这个仓库的安装脚本会：

- 使用 `git clone` 下载上游 skills 仓库。
- 使用 `curl` 下载少量单文件 skills。
- 使用 `npx gstack-codex init --global` 安装 gstack。
- 在 `~/.agents/skills` 中创建软链接。
- Superpowers 会同时创建 `superpowers` 包入口和每个 skill 的顶层入口，例如 `brainstorming`、`systematic-debugging`、`using-superpowers`。
- 在 `~/.codex/community-skills` 中保存上游源码缓存。

运行任何远程安装脚本前，都建议先阅读源码。

## License 和归属

这个仓库只是安装器和索引，不声称拥有上游 skills 的版权。

各个 skills 的版权、许可证和维护责任归其原作者和原仓库所有。请在使用、修改或二次分发前查看各上游仓库的 license。
