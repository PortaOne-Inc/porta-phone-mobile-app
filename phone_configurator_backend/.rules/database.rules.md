# Database & Data Layer Rules (FireORM)

## 1. Entities & Collections

* **FireORM:** Use `@Collection()` decorator for entities.
* **Location:** All entities must be in the `entities/` subfolder of their respective feature.
* **Registry:** Ensure any new collection is reflected in `src/common/data/collections.ts`.

## 2. Repositories

* **Injection:** Use `@InjectRepository(Entity)` to access Firestore data.
* **No Direct Firestore SDK:** Avoid using the raw `firebase-admin` Firestore SDK unless FireORM doesn't support the
  required operation.

## 3. Transformations

* **Mappers:** Do not return database entities directly to the client. Map them to DTOs in the service layer.
