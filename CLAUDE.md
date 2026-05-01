# Personal CLAUDE.md

Global preferences. Project context, architecture, and build commands belong in project `./CLAUDE.md`, not here.

If one thing stands above all others, it is this: **Simplicity is the ultimate sophistication. Our ultimate goal. The best code is the simplest code.**

## Communicating with me

- Be terse. Match my energy — if I write a one-liner, don't reply with five paragraphs.
- Always push back when I'm wrong. I'd rather hear "that's not right because X" than watch you go along with a flawed plan.
- Don't open with flattery ("great question," "you're absolutely right"). Just answer, to the point.
- If a request is ambiguous, ask a focused question before guessing. Don't invent requirements.
- No emoji in code, commits, or PR descriptions unless I specifically asked for them.

## Workflow rules

- **Never claim something is "done" or "working" without running it.** Compile, run tests, or hit the endpoint.
- **Ask before destructive operations.** Deletions, force-pushes, schema drops, `rm -rf`, cache clears, DB drops — even if you think it's safe.
- **Don't refactor code I didn't ask you to touch.** Spot something? Leave `// TODO(claude): ...` and surface it in your reply. Flag stale TODOs you notice — don't silently let them rot.
- **Hook-blocked = stop.** If a hook blocks an operation, surface it. Don't retry or work around it.
- **No silent fallbacks.** If something fails — an API call, a parse, a lookup — raise. Don't swap in a default and keep going.
- **Don't run dev servers in the foreground** unless I asked. They block the shell and I can't tell what's hanging.
- **Branch names follow `~/.claude/rules/branching.md`.** Read it before creating any branch, unless the repo has its own enforced gitflow.
- **New project setup:** ask if I want git hooks (`setup-git-hooks` skill).

## Code defaults (language-agnostic)

- **Simple over clever.** Solve today's problem. No speculative abstractions.
- **Errors are explicit.** Specific types, clear messages, never swallow. See IMPORTANT #2.
- **Fail early, fail loud.** Validate at the entry point, raise immediately. No silent fallbacks.
- **One try/catch per function max.** More than that, refactor.
- **Type everything.** No untyped parameters, no `any`, no implicit returns.
- **Prefer functions over classes.** Reach for classes only when you need state, resource management, or real orchestration.
- **Names are intent, not implementation.** `calculateMonthlyPayment` not `calc`. Pick a verb (`fetch` vs `get`) and stay consistent.
- **Minimal nesting.** Early returns over nested ifs. Past 3 levels, refactor.
- **Functions return one shape.** Pick a return type and stick to it. Don't mix `User | None | False | str`. Raise on failure or use a discriminated result.
- **Logs:** structured anywhere a human or system might re-read them later (services, jobs, CI). Plain prints only for throwaway scripts.

## IMPORTANT: REITERATING BECAUSE OF HOW IMPORTANT IT IS

1. **YAGNI** — don't build for speculation. Today's problem only.
2. **Simplest error handling the world has ever seen** — impossible to miss, trivial to diagnose. Validate at the entry point, raise immediately with a message that says exactly what failed and where. No cryptic codes, no silent swallowing. The stack trace should tell the full story.
3. **KISS** — the simplest solution is usually the best. Avoid complexity for its own sake.
4. **DELETE, DELETE, DELETE** — less code beats more. Before adding anything, ask if the right move is to delete and rebuild simpler. Patches on patches are how codebases rot; if a fix requires contorting existing code, the existing code is wrong. That said, don't delete just to hit a lower line count — delete code that no longer earns its place.

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