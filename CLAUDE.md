# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

A single Claude Code slash command (`/rog-presale`) distributed as a Markdown prompt file. It searches e-commerce platforms for ROG 20th Anniversary (Edition 20) presale information and generates a structured summary, optionally saving a Markdown report.

## Repository Structure

```
commands/rog-presale.md   ← The slash command prompt (the entire skill)
install.sh                ← Copies the command to ~/.claude/commands/
README.md                 ← User-facing documentation
```

## Installation

```bash
bash install.sh
```

This copies `commands/rog-presale.md` to `~/.claude/commands/rog-presale.md`, making `/rog-presale` available in all Claude Code sessions globally.

Alternatively, install directly via curl (no clone needed):

```bash
curl -fsSL https://raw.githubusercontent.com/gongzhun/rog-presale-skill/main/commands/rog-presale.md \
  -o ~/.claude/commands/rog-presale.md
```

## How the Skill Works

The command file (`commands/rog-presale.md`) is a Markdown prompt that Claude Code interprets at invocation time. It instructs Claude to:

1. **WebSearch** ASUS/ROG official pages for the Edition 20 product list and Chinese/English name mapping
2. **WebSearch** platform-specific presale info — Chinese platforms (JD, Tmall, Suning) use Chinese product names; international platforms (Amazon, ASUS) use English names
3. Extract structured fields: name (CN + EN), category, price, presale date, ship date, status, URL, notes
4. Output a conversational summary (not the full report)
5. Prompt the user whether to save a full Markdown report, and where
6. **Write** the report to the user-specified path if confirmed

The `$ARGUMENTS` placeholder in the command file is replaced by Claude Code with whatever the user types after `/rog-presale`.

## Parameter Handling (in the command file)

| Argument form | Behavior |
|---|---|
| `jd` / `tmall` / `amazon` | Search only that platform |
| `主板` / `显卡` / `外设` | Append product type to all search queries |
| `--cn` | Chinese platforms only (JD, Tmall, Suning) |
| `--global` | International platforms only (Amazon, ASUS) |
| `--jd-official` | JD results limited to self-operated listings only; searches both 玩家国度ROG京东自营旗舰店 and 华硕外设京东自营旗舰店; combinable with `jd` |
| `--tmall-official` | Tmall results limited to the ASUS/ROG official flagship store (asus.tmall.com); combinable with `tmall` |

| `~/path/to/dir` | Skip directory prompt, save there after user confirms |
| `~/path/to/report.md` | Skip all prompts, write report immediately |
| `report.md` | Use this filename; still ask for directory |

## Editing the Skill

Edit `commands/rog-presale.md` directly. After editing, re-run `bash install.sh` to update the globally installed copy. The installed file at `~/.claude/commands/rog-presale.md` is what Claude Code actually executes — changes to `commands/rog-presale.md` in this repo do not take effect until reinstalled.

Generated report files (`rog-presale-*.md`) are gitignored.
