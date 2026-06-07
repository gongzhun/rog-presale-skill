# /rog-presale — Claude Code Skill

> 一条命令，聚合各大电商平台 ROG 20周年系列产品预售信息，生成结构化摘要 + Markdown 报告。

## 功能

- 搜索 **京东 / 天猫 / 苏宁 / Amazon / ASUS 官方** 平台
- 在 Claude Code 对话中输出 **结构化摘要**（含 TOP 3 热门预售）
- 自动保存完整 **Markdown 报告**（`rog-presale-YYYY-MM-DD.md`）到当前目录

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
| `/rog-presale --cn` | 只搜索中文平台 |
| `/rog-presale --global` | 只搜索国际平台（Amazon、ASUS） |
| `/rog-presale report.md` | 自定义输出文件名 |

## 输出示例

**对话摘要：**
```
📊 ROG 20周年 预售信息汇总
═══════════════════════════════
搜索时间：2026-06-07 12:00
覆盖平台：5 个
发现产品：23 条

【热门预售产品 TOP 3】
1. ROG MAXIMUS Z890 APEX 20th Anniversary — 京东 — ¥4999 — 预售中
2. ROG Gladius IV 20th Anniversary — 天猫 — ¥599 — 预售中
3. ROG Swift OLED PG27AQDM 20th Anniversary — Amazon — $799 — Pre-order

📄 完整报告已保存至：./rog-presale-2026-06-07.md
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
   对话摘要 + Markdown 报告
```

## 自定义修改

直接编辑 `~/.claude/commands/rog-presale.md` 即可：
- 修改搜索关键词、增减平台
- 调整报告模板格式
- 添加其他产品线（不限 ROG 20周年）

## License

MIT
