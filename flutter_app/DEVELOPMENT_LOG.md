# Campus Connect Development Log

## Current milestone

The Flutter prototype now has a responsive dashboard and working source implementations for the main student-facing destinations: Events, Notices, Subjects, and Profile.

### Implemented

- Flutter package manifest and Material 3 app theme.
- Responsive dashboard with `MediaQuery`, `LayoutBuilder`, `Wrap`, and a scrollable `ListView`.
- Named routes for Events, Notices, Subjects, and Profile.
- Searchable Events directory with category filters and an empty-result state.
- REST-backed Notices screen with loading, error/retry, empty, and populated states.
- Expandable Subjects screen using illustrative sample content.
- Profile form with required-field validation and controller lifecycle cleanup.
- Shared saved-section state using Provider and `ChangeNotifier`.
- Reusable animated bookmark action and dashboard saved-section count.
- Unit/widget test source for profile validation, event search, saved-section state, and REST response handling.
- GitHub Actions workflow for `flutter pub get`, `flutter analyze`, and `flutter test`.
- Project report and README with syllabus mapping, setup instructions, and explicit limitations.

### Syllabus mapping

The current implementation maps to the previously identified CS506PC UI Design–Flutter topics:

1. Flutter/Dart foundation.
2. Widgets and layouts.
3. Responsive UI with `MediaQuery` and `LayoutBuilder`.
4. Navigation with `Navigator` and named routes.
5. State management with `setState`, Provider, and `ChangeNotifier`.
6. Custom widgets and themes.
7. Forms and validation.
8. Animations with `AnimatedSwitcher` and `ScaleTransition`.
9. REST API integration using `http` and `FutureBuilder`.
10. Unit/widget testing and debugging workflow.

Verify exact experiment titles/numbers against the official lab manual before submission.

### Verification status

- Source files and commit history have been checked on GitHub.
- Unit/widget test files and a CI workflow have been committed.
- Flutter analysis, test execution, browser/device launch, and screenshots are **not yet confirmed** in this session. Check the GitHub Actions run and fix any reported issues before claiming the checks passed.
- The current repository contains the Flutter source package; platform runners may need to be generated with `flutter create . --platforms=android,web` inside `flutter_app/`.

### Known demo limitations

- Events and Subjects use illustrative sample data.
- Notices use JSONPlaceholder as a demo REST endpoint, not an official college API.
- Profile details are validated but not persisted.
- Final screenshots and CI results still need to be added to the report before submission.
