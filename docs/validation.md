# DTO & Validation

All DTOs across the project use Zod via `nestjs-zod`. No `class-validator` decorators in DTO files.

---

## Pattern

```typescript
import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const CreateFooSchema = z
  .object({
    name: z.string().min(1),
    config: z.record(z.string(), z.any()).optional(),
    expectedVersion: z.number().int().min(0).optional(),
  })
  .strict();

export class CreateFooDto extends createZodDto(CreateFooSchema) {
}
```

For update DTOs, derive from the create schema:

```typescript
export const UpdateFooSchema = CreateFooSchema.partial();

export class UpdateFooDto extends createZodDto(UpdateFooSchema) {
}
```

---

## Conventions

| Convention           | Rule                                                                         |
|----------------------|------------------------------------------------------------------------------|
| Request DTOs         | Use `.strict()` to reject unknown fields                                     |
| Response DTOs        | Omit `.strict()` (allow extra Firestore fields)                              |
| Update DTOs          | Use `CreateSchema.partial()` instead of `PartialType()`                      |
| Multipart JSON       | Parse + validate manually: `Schema.parse(JSON.parse(raw))`                   |
| Path-injected fields | Mark as `.optional()` in the schema (set by controller)                      |
| Validation pipe      | Global `ZodValidationPipe` from `nestjs-zod` (registered in `app.module.ts`) |
| Shared schemas       | Reuse across DTOs where applicable (e.g. `SplashSourceZ` in splash DTOs)     |

---

## Zod + nestjs-zod Type Caveat

Zod 3.25.x (v4 compat layer) has a type inference quirk: `z.infer<>` and `createZodDto()` may
produce class types where required properties appear optional to TypeScript. Runtime validation
is unaffected -- Zod still enforces required fields.

**Workaround:** When a DTO must be structurally assignable to an external interface (e.g. `LinkRef`),
re-declare the affected properties with `declare`:

```typescript
export class LinkAssetDto extends createZodDto(LinkAssetSchema) {
  declare type: 'user' | 'embed' | 'post' | 'asset';
  declare id: string;
}
```

---

## AI Response Validation

AI-generated output (OpenAI) is validated at a second level using stricter Zod schemas in
`src/features/themes/features/generate/schemas/`. These schemas validate the JSON returned by the
LLM and fall back to deterministic defaults on failure.

| Schema                    | File                              | Validates                                         |
|---------------------------|-----------------------------------|---------------------------------------------------|
| `ColorSchemeConfigSchema` | `schemas/color-scheme.schema.ts`  | `seedColor` + 40 `#RRGGBB` fields                 |
| `WidgetConfigSchema`      | `schemas/widget-config.schema.ts` | All widget fields, strict + optional/nullable     |
| `PageConfigSchema`        | `schemas/page-config.schema.ts`   | Login + dialing pages, strict + optional/nullable |
