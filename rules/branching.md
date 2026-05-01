# Branch Naming

Use these prefixes when creating branches. Slug after the prefix is `kebab-case`, short, and describes the change. Include the ticket ID after the prefix when one exists.

| Prefix      | Use for                         | Example                   |
| ----------- | ------------------------------- | ------------------------- |
| `feat/`     | New features                    | `feat/hel-123-oauth-login` or `feat/oauth-login` |
| `fix/`      | Non-urgent bug fixes            | `fix/hel-456-stale-cache` or `fix/stale-cache` |
| `hotfix/`   | Urgent production fixes         | `hotfix/hel-789-payment-500` or `hotfix/payment-500` |
| `chore/`    | Tooling, deps, back-merges      | `chore/backmerge-payment` |
| `docs/`     | Documentation only              | `docs/api-readme`         |
| `refactor/` | Code restructuring              | `refactor/auth-module`    |
| `test/`     | Test additions or fixes         | `test/checkout-e2e`       |

- Branch from `dev` by default. `hotfix/` branches from `main`, then merges back into both `main` and `dev`.
