---
name: nested-claude-md
description: Creates or updates a nested CLAUDE.md for a complex feature or platform layer. Use when creating one for the first time or when updating after significant changes to a feature.
---

Create or update the CLAUDE.md in the target directory using @template.md as the structure.

Under 50 lines. Delete any section that doesn't apply rather than leaving it empty or padding it. If you're struggling to fill it out, the feature probably doesn't need one.

Never reference a legacy / predecessor codebase you're migrating from — the doc must read on its own merits to a future reader who has no idea one existed. Frame deferred work as "not built yet" or "ships when X forces the contract", not "not ported."

Use the **Potential Follow-ups** section to flag things noticed while building that might warrant revisiting — pragmatic shortcuts, conscious departures from a rule, work deferred under YAGNI. Each entry should say what was done (or skipped), why, and roughly when it would be worth reconsidering. This keeps a future reader (and future Claude) from re-litigating the choice or "fixing" it blindly. Skip the section when there are none.