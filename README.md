# dotclaude

My personal Claude Code config. Source of truth lives here; symlinked into `~/.claude/` so Claude Code reads it.

## Layout

- **`CLAUDE.md`** — global instructions loaded into every Claude Code session. Communication style, workflow rules, code defaults, size limits.
- **`rules/`** — path-scoped rules. Load only when matching files are touched (frontmatter `paths:`).
  - `python.md` — Python conventions
  - `tsx.md` — TS/TSX conventions
- **`skills/`** — skill definitions. Invoked by name or matched against the user's request.
  - `nextjs-layered-architecture/` — four-layer Next.js App Router architecture (`core` → `domain` → `features` → `app`). Covers Cache Components / PPR / `'use cache'` / `updateTag` / `after()`, query patterns, mutation patterns, nested features, worked examples, and a reading list of primary-source docs.
  - `nested-claude-md/` — creates or updates a nested `CLAUDE.md` for a complex feature or platform layer.
  - `setup-git-hooks/` — installs project git hooks; user-triggered only.
- **`agents/`** — personal subagent definitions. (Empty.)
- **`commands/`** — personal slash commands. (Empty.)
