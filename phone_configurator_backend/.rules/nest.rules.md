# NestJS Architecture & Coding Standards

## 1. Modularity & Features

* **Feature Isolation:** Each domain must reside in `src/features/<feature_name>/`.
* **Folder Structure:** Each feature folder MUST contain:
    * `dto/`: Data Transfer Objects (using Zod).
    * `entities/`: FireORM entity definitions.
    * `<name>.controller.ts`: API endpoints.
    * `<name>.service.ts`: Business logic.
    * `<name>.module.ts`: Dependency registration.

## 2. Dependency Injection

* **Constructor Injection:** Use private readonly properties in constructors.
* **No Service Locators:** Do not manually instantiate services.

## 3. Validation & DTOs

* **Zod-only:** Every DTO uses `z.object().strict()` + `createZodDto()` from `nestjs-zod`. No `class-validator` decorators in DTOs.
* **Pattern:**
  ```typescript
  import { z } from 'zod';
  import { createZodDto } from 'nestjs-zod';

  export const CreateFooSchema = z.object({ name: z.string().min(1) }).strict();
  export class CreateFooDto extends createZodDto(CreateFooSchema) {}
  ```
* **Partial updates:** Use `Schema.partial()` instead of `PartialType()`.
* **Response DTOs:** Omit `.strict()` (allow extra fields from Firestore).
* **Swagger:** `nestjs-zod` auto-generates OpenAPI metadata from Zod schemas.
* **Global pipe:** `ZodValidationPipe` from `nestjs-zod` is registered globally in `app.module.ts`. No per-route pipes needed.
* **Multipart JSON:** When a DTO arrives as a JSON string in a form field (e.g. splash upload), parse and validate manually: `Schema.parse(JSON.parse(raw))`.

## 4. Lifecycle & Methods

* **Async/Await:** All database or external API calls must be asynchronous and return `Promise<T>`.
* **Private Logic:** Extract complex logic from controllers and public service methods into private methods.

