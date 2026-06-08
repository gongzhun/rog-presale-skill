# /rog-presale — Claude Code Skill

> 一条命令，聚合各大电商平台 ROG 20周年系列产品预售信息，生成结构化摘要，按需保存 Markdown 报告。

## 功能

- 搜索 **京东 / 天猫 / 苏宁 / Amazon / ASUS 官方** 平台
- 自动获取产品**中英文名称对照**，中文平台用中文名搜索
- 在 Claude Code 对话中输出 **结构化摘要**（含 TOP 3 热门预售）
- **询问用户**是否生成报告，以及报告保存到哪个目录

## 安装

### 方式一：一行命令安装（推荐）

```bash
curl -fsSL https://raw.githubusercontent.com/gongzhun/rog-presale-skill/main/commands/rog-presale.md \
  -o ~/.claude/commands/rog-presale.md
```

### 方式二：克隆后运行安装脚本

```bash
git clone https://github.com/gongzhun/rog-presale-skill
cd rog-presale-skill
bash install.sh
```

### 方式三：手动复制

将 `commands/rog-presale.md` 复制到 `~/.claude/commands/` 目录即可。

---

> **前提：** 需要安装 [Claude Code](https://claude.ai/code)（CLI 工具）。

## 使用

安装后，在任意 Claude Code 会话中直接输入：

```
/rog-presale
```

### 带参数调用

| 参数示例 | 效果 |
|---------|------|
| `/rog-presale 主板` | 只搜索主板类产品 |
| `/rog-presale jd tmall` | 只搜索京东和天猫 |
| `/rog-presale --cn` | 只搜索中文平台（京东、天猫、苏宁） |
| `/rog-presale --global` | 只搜索国际平台（Amazon、ASUS） |
| `/rog-presale --jd-official` | 京东结果只含**自营**店铺，过滤第三方 |
| `/rog-presale --tmall-official` | 天猫结果只含**华硕/ROG 官方旗舰店** |
| `/rog-presale jd --jd-official` | 只搜京东且只看自营 |
| `/rog-presale tmall --tmall-official` | 只搜天猫且只看旗舰店 |
| `/rog-presale ~/Documents/ROG` | 指定报告保存目录，跳过目录询问 |
| `/rog-presale ~/Documents/ROG/report.md` | 指定完整路径，跳过所有询问直接生成 |
| `/rog-presale report.md` | 自定义文件名，仍会询问保存目录 |

## 交互流程

```
/rog-presale
    ↓
[第一步] 搜索 ASUS 官方，获取产品中英文名对照表
    ↓
[第二步] 搜索各平台预售信息
    中文平台（京东/天猫/苏宁）→ 用中文产品名搜索
    国际平台（Amazon/ASUS）   → 用英文产品名搜索
    ↓
[第三步] 提取结构化数据（中文名 + 英文名 + 价格 + 状态 ...）
    ↓
[第四步] 在对话中输出摘要
    ↓
[第五步] 询问：是否生成 Markdown 报告？(y/n)
    ├── n → 结束
    └── y → 询问：保存到哪个目录？（回车=当前目录）
              ↓ 目录不存在时询问是否自动创建
              ↓
[第六步] 写入报告，输出完整文件路径
```

## 输出示例

**对话摘要：**
```
📊 ROG 20周年 预售信息汇总
═══════════════════════════════
搜索时间：2026-06-08 12:00
覆盖平台：5 个
发现产品：23 条

【各平台概况】
• 京东：8 条 | 天猫：6 条 | 苏宁：3 条 | Amazon：4 条 | ASUS官方：2 条

【热门预售产品 TOP 3】
1. ROG MAXIMUS Z890 APEX 20周年纪念版（ROG MAXIMUS Z890 APEX 20th Anniversary）— 京东 — ¥4999 — 预售中
2. ROG 魂刃 IV 20周年纪念版（ROG Gladius IV 20th Anniversary）— 天猫 — ¥599 — 预售中
3. ROG Swift OLED PG27AQDM 20th Anniversary — Amazon — $799 — Pre-order
```

**随后询问：**
```
是否将完整数据保存为 Markdown 报告？
• 输入 y / 是 → 生成报告，并询问保存目录
• 输入 n / 否 → 不生成，结束
```

**确认后询问目录，生成完成后输出：**
```
📄 完整报告已保存至：/Users/xxx/Documents/ROG/rog-presale-2026-06-08.md
```

## 工作原理

这是一个 **Claude Code 斜杠命令**（Slash Command），本质是一个 Markdown 格式的提示词文件。Claude Code 加载后，调用时会指导 Claude 使用内置的 `WebSearch` / `Write` 工具完成搜索和报告生成，无需安装任何额外依赖。

```
~/.claude/commands/rog-presale.md   ← 本文件
         ↓ 调用 /rog-presale
   Claude Code (claude CLI)
         ↓ 使用内置工具
   WebSearch × 5 platforms
         ↓
   对话摘要 → 询问 → Markdown 报告（可选）
```

## 自定义修改

直接编辑 `~/.claude/commands/rog-presale.md` 即可：
- 修改搜索关键词、增减平台
- 调整报告模板格式
- 添加其他产品线（不限 ROG 20周年）

## License

MIT
