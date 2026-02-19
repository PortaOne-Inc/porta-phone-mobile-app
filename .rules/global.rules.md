# Global Standards & Formatting

## 1. Clean Code

* **Self-Documenting:** Use descriptive names. No redundant comments.
* **No Obvious Comments:** Do not comment on what a NestJS decorator does.
* **DartDoc Style:** Use `/** ... */` only for complex public-facing logic.

## 2. Import Ordering

Imports must be grouped and sorted alphabetically within groups:

1. **Node.js SDK** (e.g., `import fs from 'node:fs';`)
2. **NestJS Framework** (e.g., `@nestjs/common`)
3. **External dependencies** (e.g., `fireorm`, `zod`)
4. **Internal project modules** (e.g., `src/common/...`)
5. **Feature modules** (e.g., `../dto/...`)

## 3. Formatting

* **Max Width:** 120 characters.
* **Quotes:** Single quotes only.
* **Doubles:** Avoid `.0` literals unless strictly required by the type.
