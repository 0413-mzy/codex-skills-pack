# Codex Skills 全目录

生成时间：2026-05-21

总计：85 个 `SKILL.md`。其中 Codex 内置 5 个，全局/社区安装 80 个。

## 怎么调用

- 普通 skill：写 `use skill-name`，例如 `use frontend-design`。
- gstack skill：优先用斜杠命令，例如 `/office-hours`、`/review`、`/ship`。
- 你也可以只描述目标，不指定 skill。我会根据任务自动挑选合适的 skill。
- 如果你想强制我使用某个 skill，把它写在开头最稳，例如：`use baoyu-translate，把这篇文章翻译成中文`。
- 注意：`review` 有潜在重名。gstack 的评审用 `/review`，Matt Pocock 的评审用 `use review`。

## Codex 内置

这些是 Codex 自带的系统级 skills，偏“基础能力”和“创建/安装技能”。

- `imagegen`
  - 调用：`use imagegen`
  - 用途：用来生成或编辑位图图片，例如照片、插画、纹理、透明背景素材、角色图、产品 mockup、海报背景等。它适合“最终产物本身就是一张图片”的任务，比如“生成一张封面图”“把这张图改成插画风”“做一个透明背景 icon”。如果只是要写 HTML/CSS、SVG 图标、网页 UI 代码，通常不优先用它。

- `openai-docs`
  - 调用：`use openai-docs`
  - 用途：用来查询 OpenAI 官方文档和最新 API 信息。适合问模型怎么选、Responses API 怎么用、Agents SDK 怎么接、模型升级要改什么、某个参数现在是否可用。因为 OpenAI 产品变化很快，这个 skill 会优先查官方来源，避免凭旧知识回答。

- `plugin-creator`
  - 调用：`use plugin-creator`
  - 用途：用来创建 Codex 插件。插件比单个 skill 更大，可以包含 skills、MCP server、配置文件、市场元数据等。适合你想做一套可分发的 Codex 扩展，比如“做一个公司内部工具插件”“把几个 skills 打包成一个插件”。

- `skill-creator`
  - 调用：`use skill-creator`
  - 用途：用来创建或更新 Codex skill。适合把一个固定工作流沉淀下来，例如“每次写公众号都按我的流程来”“每次 code review 都按公司的检查表来”。它会指导如何写 `SKILL.md`、什么时候放脚本、什么时候放参考资料、怎么让 skill 容易被触发。

- `skill-installer`
  - 调用：`use skill-installer`
  - 用途：用来安装 Codex skills。适合从官方 curated 列表、GitHub 仓库、私有仓库里安装 skill，也可以列出可安装项目。你之前让我安装 Superpowers、gstack、Matt Pocock skills，本质上就是这类任务。

## Superpowers

Superpowers 更像一套工程纪律。它不只是“做某件事”，而是规定做事顺序：先澄清，再计划，再实现，再验证。

- `brainstorming`
  - 调用：`use brainstorming`
  - 用途：在开始创造性工作前使用。它会先帮你探索目标、约束、用户、边界和可能方案，而不是立刻写代码。适合“我要做一个功能”“帮我设计一个页面”“这个产品想法怎么样”“这个需求应该怎么拆”。如果需求还模糊，用它能避免一上来做偏。

- `dispatching-parallel-agents`
  - 调用：`use dispatching-parallel-agents`
  - 用途：当任务能拆成多个互不阻塞的小任务时使用。它会判断哪些工作可以并行，例如一个 agent 看测试，一个 agent 看 UI，一个 agent 查文档。适合大型代码库分析、多方向调研、多个独立模块同时修改。

- `executing-plans`
  - 调用：`use executing-plans`
  - 用途：当已经有实施计划时使用。它会按计划逐步执行，并在关键节点停下来检查结果。适合“这是计划，照着做”“按 docs/plan.md 实现”“执行刚才写的实施方案”。它强调不要边做边乱改方向。

- `finishing-a-development-branch`
  - 调用：`use finishing-a-development-branch`
  - 用途：开发完成后收尾用。它会检查测试、改动范围、是否需要 PR、是否该合并、是否要清理分支。适合“这个功能做完了，帮我收尾”“准备合并”“看看还差什么才能提交”。

- `receiving-code-review`
  - 调用：`use receiving-code-review`
  - 用途：收到 code review 反馈后使用。它会先判断反馈是否准确、是否和需求冲突、是否需要更多上下文，再决定怎么改。适合“reviewer 提了这些意见，帮我处理”“这个评论对吗”“按这些 review comments 修一下”。

- `requesting-code-review`
  - 调用：`use requesting-code-review`
  - 用途：完成一段开发后，请另一个视角检查。它会关注需求是否满足、实现是否稳、测试是否足够、有没有回归风险。适合“做完了，帮我 review 一遍”“合并前检查一下”。

- `subagent-driven-development`
  - 调用：`use subagent-driven-development`
  - 用途：用多个 subagent 推进开发计划。它适合任务已经比较清楚、可以分工的场景，比如“后端接口、前端页面、测试覆盖分别处理”。它会强调文件责任边界，减少并行修改冲突。

- `systematic-debugging`
  - 调用：`use systematic-debugging`
  - 用途：遇到 bug、测试失败、异常行为时使用。它要求先复现问题，再缩小范围，再提出假设，再加日志或检查，再修复并跑回归验证。适合“这个报错怎么回事”“测试挂了”“线上行为不对”“性能突然变慢”。

- `test-driven-development`
  - 调用：`use test-driven-development`
  - 用途：用 TDD 写功能或修 bug。它会先写失败测试，再实现最小代码让测试通过，再重构。适合核心逻辑、边界条件复杂、容易回归的功能。对于纯视觉微调，通常不必强行 TDD。

- `using-git-worktrees`
  - 调用：`use using-git-worktrees`
  - 用途：开始较大功能、实验性修改或多分支工作前使用。它会帮你把当前工作和新工作隔离开，避免污染主工作区。适合“开个独立分支做这个”“我不想影响当前改动”。

- `using-superpowers`
  - 调用：`use using-superpowers`
  - 用途：启动 Superpowers 的总入口。它会要求 agent 在每次任务前检查是否有相关 skill，并优先按 skill 流程做事。适合你想让 Codex 更主动、更有章法地使用 skills。

- `verification-before-completion`
  - 调用：`use verification-before-completion`
  - 用途：在我准备说“完成了、修好了、测试过了”之前使用。它要求必须拿到实际验证证据，例如测试输出、构建输出、截图检查、命令结果。适合任何你不想听空口保证的任务。

- `writing-plans`
  - 调用：`use writing-plans`
  - 用途：在动手改代码前写实施计划。它适合多步骤、有风险、跨文件或跨模块的任务。输出通常是清晰的阶段、文件范围、测试策略和检查点。

- `writing-skills`
  - 调用：`use writing-skills`
  - 用途：创建、修改或验证 skill 时使用。它会帮助判断 skill 触发条件、说明层级、脚本组织、测试方式，避免写出太长但不好用的 skill。

## gstack

gstack 偏产品思考、计划评审、浏览器 QA 和发版流程。它的技能更像斜杠命令，所以建议用 `/xxx`。

- `gstack`
  - 调用：`/gstack`
  - 用途：用浏览器自动化检查网站或 Web App。它可以打开页面、点击按钮、填写表单、检查响应式布局、截图、对比修改前后效果。适合“帮我打开本地页面看看”“测试这个登录流程”“部署后帮我验一下”。

- `gstack-upgrade`
  - 调用：`/gstack-upgrade`
  - 用途：升级 gstack 工具包。它会判断当前是全局安装还是项目内安装，然后执行更新并展示有什么变化。适合“更新 gstack”“升级这些 slash commands”。

- `office-hours`
  - 调用：`/office-hours`
  - 用途：像 YC Office Hours 一样帮你推敲产品想法。它会问需求真实性、用户痛点、现状替代方案、最窄切入点、如何观察信号等问题。适合“我有个想法”“这个产品值得做吗”“帮我 brainstorm 一下”。

- `plan-ceo-review`
  - 调用：`/plan-ceo-review`
  - 用途：从 CEO/创始人视角审视计划。它会挑战问题定义、商业价值、用户价值、野心程度和范围取舍。适合“这个方案是不是太小了”“帮我站在创始人角度看”“有没有更 10x 的方案”。

- `plan-eng-review`
  - 调用：`/plan-eng-review`
  - 用途：从工程负责人视角审视计划。它会检查架构、数据流、模块边界、性能、测试、边界情况和实施顺序。适合“开工前帮我技术评审”“这个架构稳不稳”“计划能不能落地”。

- `review`
  - 调用：`/review`
  - 用途：合并前代码评审。它重点看 diff 里的结构性风险，例如 SQL 安全、LLM 输入输出边界、条件副作用、测试缺口。适合“PR 合并前帮我看一遍”“检查这个 diff”。

- `ship`
  - 调用：`/ship`
  - 用途：发版或提交 PR 的完整流程。它会检查 base branch、跑测试、看 diff、更新版本和 changelog、提交、推送、开 PR。适合“准备发布”“帮我 ship”“开个 PR”。

## Matt Pocock

这批 skills 偏工程实践、需求整理、代码诊断、写作和产品思考。

- `caveman`
  - 调用：`use caveman`
  - 用途：极简沟通模式。它会减少客套、铺垫和长句，只保留技术要点。适合你想让我“短一点、直接一点、少废话”的时候。注意它会持续生效，直到你说恢复正常模式。

- `design-an-interface`
  - 调用：`use design-an-interface`
  - 用途：为模块、API 或接口形状生成多个差异明显的设计方案。它适合“这个模块接口怎么设计”“这个抽象应该长什么样”“帮我比较几种 API 设计”。输出通常会有多个候选方案和取舍分析。

- `diagnose`
  - 调用：`use diagnose`
  - 用途：诊断复杂 bug 或性能问题。它比普通“猜一个原因”更严格，会要求复现、最小化、提出假设、验证假设、修复和回归测试。适合难以直接看出来的问题。

- `edit-article`
  - 调用：`use edit-article`
  - 用途：编辑文章草稿。它会关注结构、逻辑顺序、段落节奏、表达清晰度和删减冗余。适合“帮我润色这篇文章”“结构有点乱，帮我改”“让这篇更有说服力”。

- `git-guardrails-claude-code`
  - 调用：`use git-guardrails-claude-code`
  - 用途：给 Claude Code 设置 git 安全护栏，阻止危险操作，例如 `git reset --hard`、`git clean`、强推、删除分支等。适合多人协作或你担心 agent 误操作仓库时。

- `grill-me`
  - 调用：`use grill-me`
  - 用途：高强度追问你的计划、设计或想法。它不是温和总结，而是不断逼近关键假设、模糊点和未决问题。适合“我想被挑战一下”“帮我找漏洞”“这个计划哪里站不住”。

- `grill-with-docs`
  - 调用：`use grill-with-docs`
  - 用途：结合项目文档来追问计划。它会参考领域术语、已有 ADR、上下文文档，并在讨论中更新文档。适合成熟项目里做重要设计决策。

- `handoff`
  - 调用：`use handoff`
  - 用途：把当前对话整理成交接文档。它适合长会话快结束、要切换 agent、要把上下文交给未来的自己时。输出会包含目标、已完成内容、未完成事项、关键文件和下一步。

- `improve-codebase-architecture`
  - 调用：`use improve-codebase-architecture`
  - 用途：从架构角度审视代码库。它会寻找耦合过重、概念边界不清、测试困难、领域语言混乱、重复抽象等问题。适合“帮我看看这个项目怎么重构”“哪里架构不健康”。

- `migrate-to-shoehorn`
  - 调用：`use migrate-to-shoehorn`
  - 用途：把 TypeScript 测试里的 `as` 类型断言迁移到 `@total-typescript/shoehorn`。适合测试数据构造很多、类型断言泛滥的项目。

- `obsidian-vault`
  - 调用：`use obsidian-vault`
  - 用途：在 Obsidian vault 里搜索、创建、整理笔记。它适合“把这个保存到 Obsidian”“帮我找 vault 里的相关笔记”“新建一个带 wikilink 的知识页”。前提是我知道你的 vault 本地路径。

- `prototype`
  - 调用：`use prototype`
  - 用途：先做可抛弃原型来探索方案。它适合还不确定数据模型、状态机、交互流程或 UI 方向时。可以做终端原型，也可以做多个 UI 变体，让你先玩一下再决定正式实现。

- `qa`
  - 调用：`use qa`
  - 用途：进行交互式 QA 会话。你可以像口述 bug 一样描述问题，它会结合代码上下文整理成清晰 issue。适合产品验收、手动测试、集中收集问题。

- `request-refactor-plan`
  - 调用：`use request-refactor-plan`
  - 用途：把重构想法变成可执行计划。它会通过访谈明确目标、风险、边界和拆分方式，然后形成适合提交到 issue tracker 的计划。适合大重构前先规划。

- `review`
  - 调用：`use review`
  - 用途：Matt Pocock 版代码评审。它会从两个角度看改动：是否符合项目标准，是否符合原始需求/PRD。适合“review since main”“帮我看这个分支是否符合规格”。

- `scaffold-exercises`
  - 调用：`use scaffold-exercises`
  - 用途：生成课程练习结构。适合做编程课程、训练营、教程项目时批量创建题目、答案、讲解和目录。

- `setup-matt-pocock-skills`
  - 调用：`use setup-matt-pocock-skills`
  - 用途：为 Matt Pocock 的工程类 skills 初始化项目上下文。它会配置 issue tracker、triage label、领域文档位置等。第一次在某个项目里使用 `triage`、`to-prd`、`to-issues`、`diagnose`、`tdd` 前建议先跑它。

- `setup-pre-commit`
  - 调用：`use setup-pre-commit`
  - 用途：配置 pre-commit 检查。它适合给项目加 Husky、lint-staged、Prettier、类型检查、测试等提交前保障。

- `tdd`
  - 调用：`use tdd`
  - 用途：Matt Pocock 版测试驱动开发。它强调 red-green-refactor，适合核心逻辑、工具函数、业务规则、bug 修复。输出通常会先有失败测试，再有实现。

- `to-issues`
  - 调用：`use to-issues`
  - 用途：把计划、PRD 或规格拆成 issues。它会尽量拆成可独立领取、可验证、垂直切片的任务。适合“把这个项目拆成 GitHub issues”“帮我生成 tickets”。

- `to-prd`
  - 调用：`use to-prd`
  - 用途：把当前对话整理成 PRD。适合你和我聊了一堆需求后，需要沉淀成产品需求文档，再交给工程实现。

- `triage`
  - 调用：`use triage`
  - 用途：整理和分类 issues。它适合处理 bug、feature request、用户反馈，把它们推进到清晰状态：缺信息、可执行、已排期、关闭等。

- `ubiquitous-language`
  - 调用：`use ubiquitous-language`
  - 用途：提取领域统一语言。适合复杂业务项目里统一术语，例如“客户、账户、订阅、订单这些词到底怎么定义”。输出通常是 glossary，并指出歧义。

- `write-a-skill`
  - 调用：`use write-a-skill`
  - 用途：创建新的 agent skill。它会帮你把触发条件、流程、脚本、参考资料组织清楚。适合把你反复做的工作标准化。

- `writing-beats`
  - 调用：`use writing-beats`
  - 用途：用“叙事片段”的方式写文章。它会让你从原始素材中选择一个起点，然后逐段推进。适合写故事性、经验型、思考型文章。

- `writing-fragments`
  - 调用：`use writing-fragments`
  - 用途：先收集写作碎片，不急着成文。适合你脑子里有很多点子、句子、例子，但还没有结构的时候。

- `writing-shape`
  - 调用：`use writing-shape`
  - 用途：把已有笔记或粗稿塑造成文章。它会和你一起选开头、组织段落、调整结构、决定是否用列表/表格/引用/小标题。

- `zoom-out`
  - 调用：`use zoom-out`
  - 用途：让 agent 拉远视角解释上下文。适合“这段代码在整个系统里是什么角色”“我不熟这个模块，先给我讲大图”。

## Frontend Design

偏前端页面、组件和产品界面实现质量。

- `frontend-design`
  - 调用：`use frontend-design`
  - 用途：创建有辨识度、生产级、高质量的前端界面。它适合网页、组件、dashboard、工具型应用、产品页面等任务。重点是避免普通 AI 页面常见的问题：空洞 hero、单调渐变、卡片堆叠、视觉层级弱、移动端不稳。

## UI/UX Pro Max

偏 UI/UX、品牌、设计系统、视觉资产和演示物。

- `ckm:banner-design`
  - 调用：`use ckm:banner-design`
  - 用途：设计社媒 banner、广告图、网站 hero、活动图、印刷横幅等。它会考虑平台尺寸、文案层级、视觉风格和图片生成方向。适合“做一张 LinkedIn banner”“生成广告主图”“设计网站首屏视觉”。

- `ckm:brand`
  - 调用：`use ckm:brand`
  - 用途：处理品牌声音和视觉识别。适合品牌命名、品牌语气、价值主张、视觉规范、资产一致性、营销文案风格等任务。

- `ckm:design`
  - 调用：`use ckm:design`
  - 用途：综合设计入口。它覆盖 logo、品牌识别、CIP、设计 token、banner、icon、社媒图、HTML 演示等。适合你不确定该用哪个设计 skill，但任务明显是“设计一套东西”的时候。

- `ckm:design-system`
  - 调用：`use ckm:design-system`
  - 用途：建设设计系统。它会关注 token 分层、颜色语义、字号/间距体系、组件规格、CSS 变量和跨页面一致性。适合“做一套 design system”“统一 UI 规范”“整理组件库”。

- `ckm:slides`
  - 调用：`use ckm:slides`
  - 用途：创建战略型 HTML 演示文稿。适合产品汇报、商业分析、策略讲解、数据展示。它会考虑页面节奏、图表表达、文案公式和视觉一致性。

- `ckm:ui-styling`
  - 调用：`use ckm:ui-styling`
  - 用途：用 shadcn/ui、Radix、Tailwind 等方式构建漂亮、可访问、响应式的 UI。适合表单、弹窗、导航、表格、侧边栏、主题切换、暗色模式等前端界面细化。

- `ui-ux-pro-max`
  - 调用：`use ui-ux-pro-max`
  - 用途：大型 UI/UX 知识库。它包含风格、色板、字体搭配、产品类型、UX 准则、图表类型和多个技术栈建议。适合“帮我把这个界面做得更专业”“设计 dashboard”“优化交互体验”“检查可访问性和视觉层级”。

## Baoyu

偏中文内容生产、图片生成、Markdown/网页转换、社媒发布。

- `baoyu-article-illustrator`
  - 调用：`use baoyu-article-illustrator`
  - 用途：给文章配图。它会先分析文章结构，判断哪些段落需要插图，再决定图片类型、风格和色板。适合公众号、博客、长文、教程类内容的视觉增强。

- `baoyu-comic`
  - 调用：`use baoyu-comic`
  - 用途：把知识内容做成漫画。它会拆分剧情、设计分镜、控制画风和语气。适合科普、教程、人物故事、概念解释类漫画。

- `baoyu-compress-image`
  - 调用：`use baoyu-compress-image`
  - 用途：压缩和优化图片。适合把 PNG/JPG 转 WebP、降低文件大小、优化网页加载或发布素材体积。

- `baoyu-cover-image`
  - 调用：`use baoyu-cover-image`
  - 用途：生成文章封面图。它会考虑画幅、色彩、渲染风格、标题文字和情绪。适合公众号封面、博客封面、社媒分享图。

- `baoyu-danger-gemini-web`
  - 调用：`use baoyu-danger-gemini-web`
  - 用途：通过非官方 Gemini Web API 生成文本或图片。因为是 reverse-engineered API，所以稳定性、账号风险和权限边界都要谨慎。只有在你明确接受风险时才适合用。

- `baoyu-danger-x-to-markdown`
  - 调用：`use baoyu-danger-x-to-markdown`
  - 用途：把 X/Twitter 内容转 Markdown。适合保存推文、线程或 X article 到本地笔记。因为使用非官方接口，通常需要明确同意。

- `baoyu-diagram`
  - 调用：`use baoyu-diagram`
  - 用途：生成专业 SVG 图表。适合架构图、流程图、时序图、状态机、系统关系图、概念图。输出是独立 SVG 文件，适合放进文档或文章。

- `baoyu-format-markdown`
  - 调用：`use baoyu-format-markdown`
  - 用途：整理和美化 Markdown。它会加标题、摘要、层级、列表、重点、代码块等。适合把口述稿、粗糙笔记、文章初稿整理成清晰 Markdown。

- `baoyu-image-cards`
  - 调用：`use baoyu-image-cards`
  - 用途：生成一组社媒图片卡片。适合小红书、微信图文、知识卡片、视觉摘要。它会把内容拆成多张卡片，并选择布局、色彩和插画风格。

- `baoyu-image-gen`
  - 调用：`use baoyu-image-gen`
  - 用途：旧版图片生成入口，已弃用。现在建议优先使用 `baoyu-imagine`。

- `baoyu-imagine`
  - 调用：`use baoyu-imagine`
  - 用途：综合 AI 图片生成。支持多个模型和服务商，能做 text-to-image、参考图生成、比例控制、批量生成。适合“按这个提示词生成图”“基于参考图做一组图”。

- `baoyu-infographic`
  - 调用：`use baoyu-infographic`
  - 用途：生成专业信息图。适合把复杂内容、数据、流程、对比、知识点做成一张高密度视觉图。常用于文章配图、社媒传播、报告摘要。

- `baoyu-markdown-to-html`
  - 调用：`use baoyu-markdown-to-html`
  - 用途：把 Markdown 转成带样式的 HTML，特别适合微信公众号。它支持代码高亮、数学公式、PlantUML、脚注、提示块、外链底部引用。适合“把这篇 Markdown 转成公众号可用 HTML”。

- `baoyu-post-to-wechat`
  - 调用：`use baoyu-post-to-wechat`
  - 用途：发布内容到微信公众号。适合把文章、HTML、Markdown 或多图内容发到公众号草稿或后台。通常需要账号、API 或浏览器登录配合。

- `baoyu-post-to-weibo`
  - 调用：`use baoyu-post-to-weibo`
  - 用途：发布微博内容。支持普通文字、图片、视频和头条文章。适合“把这段整理成微博发出去”“发布微博长文”。

- `baoyu-post-to-x`
  - 调用：`use baoyu-post-to-x`
  - 用途：发布 X/Twitter 内容。支持普通推文、图片、视频和长文。适合“帮我发推”“把这篇改成 X thread 并发布”。

- `baoyu-slide-deck`
  - 调用：`use baoyu-slide-deck`
  - 用途：根据内容生成 slide deck 图片。它会先做大纲，再生成每页视觉。适合内容型演示、分享课件、社媒长图幻灯片。

- `baoyu-translate`
  - 调用：`use baoyu-translate`
  - 用途：翻译文章和文档。支持快速翻译、标准翻译、精修翻译。适合“翻译成中文/英文”“精翻这篇”“保持术语一致”“本地化这份文档”。

- `baoyu-url-to-markdown`
  - 调用：`use baoyu-url-to-markdown`
  - 用途：抓取网页并转换成 Markdown。适合保存文章、网页、X/Twitter 内容、YouTube 字幕、Hacker News 讨论等到本地。遇到登录或验证码时可能需要浏览器配合。

- `baoyu-wechat-summary`
  - 调用：`use baoyu-wechat-summary`
  - 用途：总结微信群聊精华。适合“帮我看看这个群最近聊了什么”“整理群聊摘要”“生成毒舌版群聊总结”。通常依赖本地微信数据工具。

- `baoyu-xhs-images`
  - 调用：`use baoyu-xhs-images`
  - 用途：旧版小红书图片卡片 skill，已弃用。现在建议用 `baoyu-image-cards`。

- `baoyu-youtube-transcript`
  - 调用：`use baoyu-youtube-transcript`
  - 用途：下载 YouTube 字幕、转录文本和封面图。适合“把这个视频转文字”“下载字幕”“提取封面”“总结视频内容”。支持多语言和章节。

## Markdown to HTML

偏通用 Markdown 转 HTML，不专门绑定微信公众号。

- `markdown-to-html-skill`
  - 调用：`use markdown-to-html-skill`
  - 用途：把 Markdown 文件转换成 HTML。可使用 marked.js、pandoc、gomarkdown，或 Jekyll/Hugo 等静态站点生成器。适合做普通网页、静态站点、文档页面、博客构建流程。和 `baoyu-markdown-to-html` 的区别是：这个更通用，`baoyu-markdown-to-html` 更偏微信公众号排版。
