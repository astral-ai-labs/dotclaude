---
paths:
  - "**/*.py"
---

# Python Rules

## Naming
- `snake_case` — functions, variables, files
- `PascalCase` — classes, Pydantic models, TypeAliases
- `SCREAMING_SNAKE_CASE` — constants
- Boolean prefixes: `is_`, `has_`, `can_`, `should_`

## Style
- Double quotes (Black)
- Trailing commas in all multi-line structures
- Type hints everywhere — no `Any`
- Functions over classes. Classes only for Pydantic models or stateful objects that genuinely need them.
- One return shape per function. Don't mix `User | None | False`. Raise on failure; don't sentinel-mix.

## File Header (required on every file)

```python
# ==============================================================================
# <module_name>.py — <one short sentence>
# ==============================================================================
# Purpose: <what this module does — ONE sentence>
# ==============================================================================
```

## Imports (four groups, separated by blank line)

```python
# Standard Library -------------------------------------------------------------
import os

# Third Party ------------------------------------------------------------------
import pydantic

# Core (app-wide) --------------------------------------------------------------
from app.core.config import settings

# Internal (current module) ----------------------------------------------------
from . import utils
```

## Public API
`__all__` goes at the top of every file, immediately after imports. Start with the minimum possible exports — if you're unsure whether something should be exported, it shouldn't be. Only export what another module concretely needs today.

```python
# ==============================================================================
# Public API
# ==============================================================================

__all__ = ["process_user_data"]  # start minimal, add only when needed

# ==============================================================================
# <Next Section>
# ==============================================================================
```

## Types
- Types live in their layer's dedicated `*_types.py` file — `api/api_types.py`, `data/data_types.py`, etc. — never inline in logic files. Don't pre-create empty files; add the file when there's at least one type to put there.
- Errors (exception classes) are exempt: they live in a feature-level `errors.py` (or layer-level like `data/errors.py`) alongside the rest of the feature's error vocabulary.
- Pydantic `BaseModel` or `TypedDict`s for structured data. Quick pydantic rules: 
	1. Use `Field` when it makes sense with a concise description.
	2. Use `ConfigDict` instead of nested class `Config` (Pydantic 2.0).
	3. Prefer frozen=True in ConfigDict to make internal data passing safer
- Local models (function-scoped only) defined immediately above the function that uses them, prefixed `_`

## Docstrings
1-2 concise sentences max. If a very complex function, use a concise 1-2 sentences + some bullet points.

## Formatting
- Files under 300 lines. Split at the seam.
- Functions under 50 lines, one job each.
- Max 2-3 nesting levels — use early returns.
- Numbered comments for multi-step flows: `# 1️⃣ Validate  # 2️⃣ Process  # 3️⃣ Return`