#!/bin/bash
# Install the /rog-presale skill into Claude Code globally

DEST="$HOME/.claude/commands"
mkdir -p "$DEST"
cp commands/rog-presale.md "$DEST/rog-presale.md"
echo "✅ Installed: /rog-presale is now available in all Claude Code sessions."
