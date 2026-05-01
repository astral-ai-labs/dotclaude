---
name: log-decision
description: Appends an entry to docs/decisions.md when an architectural or cross-cutting decision is made. Use when committing to a tech choice that other agents might re-litigate (e.g. SSE vs WebSockets, RLS vs service-role, a library choice). Don't use for single-file implementation choices.
---

Append a new entry to `docs/decisions.md` (create from @template.md if missing).

Increment the D-### counter from the last entry. Use today's date.

If the user hasn't given a clear "Revisit if" condition, ask. Don't guess one.
