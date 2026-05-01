# Personal CLAUDE.md

Global preferences. Project context, architecture, and build commands belong in project `./CLAUDE.md`, not here.

If one thing stands above all others, it is this: **Simplicity is the ultimate sophistication. Our ultimate goal. The best code is the simplest code.**

## Communicating with me

- Be terse. Match my energy — if I write a one-liner, don't reply with five paragraphs.
- Alays push back when I'm wrong. I'd rather hear "that's not right because X" than watch you go along with a flawed plan.
- Don't open with flattery ("great question," "you're absolutely right"). Just answer, to the point.
- If a request is ambiguous, ask a focused question before guessing. Don't invent requirements.
- No emoji in code, commits, or PR descriptions unless I specifically asked for them.

## Workflow rules

- **Never claim something is "done" or "working" without running it.** Compile, run tests, or hit the endpoint.
- **Ask before destructive operations.** Deletions, force-pushes, schema drops, `rm -rf`, cache clears, DB drops — even if you think it's safe.
- **Don't refactor code I didn't ask you to touch.** Spot something? Leave `// TODO(claude): ...` and mention it. Don't do it. Never let the TODOs get stale.
- **Hook-blocked = stop.** If a hook blocks an operation, surface it. Don't retry or work around it.
- **No silent fallbacks.** If something fails — an API call, a parse, a lookup — raise. Don't swap in a default and keep going.
- **Don't run dev servers in the foreground** unless I asked. They block the shell and I can't tell what's hanging.
- **Branch names follow `~/.claude/rules/branching.md`.** Read it before creating any branch, unless the repo has its own enforced gitflow.
- **New project setup:** ask if I want git hooks (`setup-git-hooks` skill).

## Code defaults (language-agnostic)

- **Simple over clever.** Solve today's problem. No speculative abstractions.
- **Errors are explicit.** Specific error types, clear messages, never swallow. Full philosophy in IMPORTANT #2.
- **Logs:** use judgment — structured context (`{"user_id": ..., "error": ...}`) for services and anything shipping to a log aggregator; plain strings fine for scripts and CLIs.
- **One try/catch per function max.** More than that, refactor.
- **Prefer functions over services.** Standalone functions in well-named modules beat class hierarchies. Reach for classes only when you need state, resource management, or real orchestration.
- **Singletons for expensive clients.** DB connections, Redis, HTTP sessions, API clients, Celery — initialize once, reuse. Put in proper place.
- **Type everything.** No untyped parameters, never use `any`, no implicit returns.
- **Names are intent, not implementation.** `calculateMonthlyPayment` not `calc`. Pick a verb (`fetch` vs `get`) and stay consistent across the codebase.
- **Early returns over nested ifs.** Past 3 levels of indentation, refactor.

## IMPORTANT: REITERATING BECAUSE OF HOW IMPORTANT IT IS

1. **YAGNI (You Aren't Gonna Need It)** — Avoid building functionality on speculation. 
2. **Simplest Error Handling the world has ever seen**: 
	- Errors should be impossible to miss and trivial to diagnose. 
	- Validate at the entry point, raise immediately with a message that tells you exactly what was wrong and where.
	- No hunting through logs, no cryptic codes, no silent swallowing. If something fails, the stack trace alone should tell the full story.
3. **Simplicity is the ultimate sophistication**: 
	- The simplest solution is often the best.
	- Avoid complexity for its own sake.
	- Keep it simple, stupid (KISS).
4. **DELETE, DELETE, DELETE**: The best solution is usually less code, not more. 
	- Before adding anything — a fix, a feature, a helper — ask whether the right move is to delete and rebuild simpler instead. 
	- Patches on top of patches are how codebases rot. If you're debugging and the fix requires contorting the existing code, that's a signal the existing code is wrong, not that you need a cleverer patch. Delete it, write something cleaner. 
	- That said, deletion for its own sake is not the goal — don't remove code just to hit a lower line count. Delete code that no longer earns its place. Simplicity is our ultimate goal.

## Size limits (defaults — break with reason)

- Files under 300 lines. Past that, split.
- Functions under 50 lines, one job each.
- Classes under 100 lines, one concept each.

## Comments

- WHY, not WHAT. Code that needs a comment to explain what it does is wrong.
- Comments + Docstrings + function headers + inline comments + TODOs + whatever else should be concise as hell.
- Update comments when the code changes. Stale comments are worse than none.
- For multi-step functions, number steps inline (`# 1️⃣`, `# 2️⃣`, ...) so the flow is scannable. (yes, emoji is allowed here)

## Dependencies

- Default to popular, actively maintained libraries. Commits in the last 6 months, real issue triage, real docs.
- Minimize count. Each dep is a future security review.
- Check bundle size before adding frontend deps.
- **Before writing any utility or helper, check the standard library first, then existing dependencies.** If it already exists, use it. The best code is code you didn't write.

## Project Documentation

- **Nested CLAUDE.md** — for complex features or platform layers, under 50 lines, cheat sheet not docs. Use `nested-claude-md` skill.
- **Decision log** — when committing to an architectural or cross-cutting choice (tech choice, pattern, library) that other agents might re-litigate, append to `docs/decisions.md`. Use `log-decision` skill. Don't log single-file implementation choices.

## Where the rest lives

- **Language-specific rules** (Python, TS/TSX): `~/.claude/rules/` — load automatically only when matching files are touched.
- **Workflow rules** (e.g. `branching.md`): `~/.claude/rules/` — read on demand, referenced from this file.
- **Project architecture, build commands, conventions**: that project's `./CLAUDE.md`, not here.