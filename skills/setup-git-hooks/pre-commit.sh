#!/bin/sh
# To restrict this hook to Claude-aware projects only, uncomment below:
# if [ -z "$(find . -name "CLAUDE.md" -not -path "./.git/*" 2>/dev/null)" ]; then
#   exit 0
# fi

claude -p "Look at the staged diff. Update any nested CLAUDE.md files and the README that are stale given the changes. You should not look outside your scoped changes for stale ones. Be minimal — only update what's actually out of date. Follow the template at ~/.claude/skills/nested-claude-md/template.md for any nested CLAUDE.md files." \
  --allowedTools "Read,Edit,Bash(git diff *)"