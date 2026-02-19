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

* **Zod:** Use `nestjs-zod` for all DTOs and validation.
* **Swagger:** Annotate controllers and DTOs to ensure the API is fully documented.

## 4. Lifecycle & Methods

* **Async/Await:** All database or external API calls must be asynchronous and return `Promise<T>`.
* **Private Logic:** Extract complex logic from controllers and public service methods into private methods.

