# Documentation

## [Theme Edit](theme_edit.md)

Theme configuration system — color schemes, widget styling, page layouts, feature access,
launch icons, and splash screens. Architecture, state management, data flow, and API integration.

## [Session Expiry & Re-login](auth-session-expiry.md)

How the app reacts to an expired token / HTTP 401: full-screen re-login over the current page,
suppression of redundant 401 error dialogs, and re-initialization of the open view page after
re-login (while preserving unsaved edits in editor/form pages).

## [Splash Screen & Launch Icon Constraints](splash-and-icon-constraints.md)

Platform-specific constraints and safe zone calculations for splash screens and launch icons
across Android, iOS, and Web. Includes official spec references and known issue fixes.
