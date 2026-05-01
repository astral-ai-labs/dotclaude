---
paths:
  - "**/*.tsx"
  - "**/*.jsx"
  - "**/*.ts"
  - "**/*.js"
---

# TSX/JSX Rules

## Naming
- `camelCase` — functions, variables, hooks, props
- `PascalCase` — components, types, interfaces, enums
- `SCREAMING_SNAKE_CASE` — constants
- Boolean prefixes: `is`, `has`, `can`, `should` (e.g. `isLoading`, `hasError`)
- Event handlers: `handle` prefix — `handleClick`, `handleSubmit`
- **Files: kebab-case always.** No exceptions.
- File suffixes:
  - `*.types.ts` — dedicated types file for a module or domain
  - `*.utils.ts` — pure utility functions
  - `*.dal.ts` — data access layer (one per table or entity)
  - `*.client.ts` / `*.server.ts` — runtime-split pair, same export name

## Style
- `"use client"` at the very top when required, before everything else
- Double quotes for JSX props, single quotes for JS strings
- Trailing commas in all multi-line structures
- Never use 'any' unless you have a very good reason.
- `interface` for object shapes that might extend; `type` for unions, intersections, and aliases
- Functions over classes. Never use class components.
- One return shape per function. Avoid wide unions like `User | null | false | string` — pick one, or use a discriminated union (`{ ok: true, data } | { ok: false, error }`).


## File Header (required on every file)

```tsx
/* ========================================================================= */
// .tsx — <short 1-2 sentence MAX>
/* ========================================================================= */
// Purpose: <what this file does> 2-3 concise sentences MAX.
// Sections: Imports, Types, Component, Public API
/* ========================================================================= */
```

## Imports (four groups, separated by blank line)

```tsx
/* ========================================================================= */
// Imports
/* ========================================================================= */

// Standard Library/Runtime --------------------------------------------------
import { useState, useCallback } from "react"

// Third Party ---------------------------------------------------------------
import { Command } from "lucide-react"

// Core (app-wide) -----------------------------------------------------------
import { cn } from "@/core/utilities/cn.utils"

// Internal (current module) -------------------------------------------------
import { buildFirstMessage } from "../messages"
```

## Public API
`export` statements go at the bottom of every file. Start with the minimum — if unsure whether something should be exported, it shouldn't be. Never export prop interfaces unless another file concretely needs them today.

```tsx
/* ========================================================================= */
// Public API
/* ========================================================================= */

export { CommandHintBadge }  // start minimal, add only when needed
```

## Types
- App-wide and shared types live in dedicated `*.types.ts` files — never inline in logic files
- Local types (function- or component-scoped only) defined immediately above the function or component that uses them
- If you think it makes sense for best practices, use Zod for runtime validation of uncertain data.


## Components
- One component per file
- Props interface defined immediately above the component, never exported unless required externally
- Pure presentational components return early on falsy conditions before any JSX
- Keep JSX shallow — max 2 levels of nesting before extracting a component

## Docstrings
1-2 concise sentences max. If a very complex function, use a concise 1-2 sentences + some bullet points. 
Use per-field `/** ... */` comments only on non-obvious type fields.

## Formatting
- Files under 250 lines. Split at the seam.
- Functions under 50 lines, one job each.
- Max 2-3 nesting levels — use early returns.
- Numbered comments for multi-step logic: `// 1️⃣ Validate  // 2️⃣ Process  // 3️⃣ Return`