# Backend Architecture & Integration Rules

This backend serves as the configuration engine for
the [WebTrit Phone Configurator](https://github.com/WebTrit/webtrit_phone_configurator). It manages themes, assets, and
feature toggles for the mobile application.

## 1. System Role & Responsibility

* **Configuration Provider:** The primary goal is to provide structured JSON/Asset data that the mobile Flutter app can
  consume to dynamically change its UI and behavior.
* **Asset Management:** Responsibility includes managing cloud storage paths for images, icons, and splash screens used
  by the mobile app.

## 2. Feature-Based Modularization

* **Strict Domain Isolation:** Each feature in `src/features/` (e.g., `themes`, `assets`, `applications`) must be
  self-contained.
* **Cross-Feature Communication:** * If `Feature A` needs logic from `Feature B`, it MUST be done via Service injection.
    * Controllers must never call Services from other features directly; keep orchestration in the Service layer.
* **Shared Logic:** Global utilities and base classes (like `OwnedRepoGuard` or `FirestoreUtils`) reside in
  `src/common/`.

## 3. Data Flow & Contract (API-First)

* **Mobile Compatibility:** Since this backend serves a Flutter frontend, response DTOs must maintain strict
  compatibility. Any breaking change in the DTO requires versioning or a coordinated update with the mobile app.
* **Consistency:** Ensure that IDs and references (like `asset-ref.ts`) are consistent across `themes`, `assets`, and
  `artifacts`.

## 4. Environment & Firebase Integration

* **Cloud Functions Entry Point:** `index.ts` is the main entry point for Firebase Functions. New modules must be
  registered in `app.module.ts` to be reachable.
* **Service Accounts:** Always use the appropriate environment credentials (`creds/firebase-*.json`). Never hardcode
  project-specific IDs.
* **Storage Pathing:** Follow a consistent naming convention for Firebase Storage paths to ensure the mobile app can
  correctly resolve generated URLs.

## 5. Domain-Specific Logic

* **Themes Feature:** Handles the complex logic of merging color schemes and widget configurations.
* **Translations Feature:** Manages synchronization with Localizely. Ensure the output format is compatible with the
  mobile app's localization loader.
* **GitHub Proxy:** Used for fetching configuration or source data. Ensure proper token handling as defined in `.env`.
