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
- GitHub Actions workflow for the Dart basics example, `flutter pub get`, `flutter analyze`, `flutter test`, and a Web release build.
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
8. Animations with `AnimatedSwitcher`, `FadeTransition`, `SlideTransition`, and `ScaleTransition`.
9. REST API integration using `http` and `FutureBuilder`.
10. Unit/widget testing and debugging workflow.

Experiment mapping in the README and project report is aligned to the official JNTUH R22 CS506PC syllabus linked there; follow any institution-specific lab-manual edition supplied by the instructor.

### Verification status

- Source files and commit history have been checked on GitHub.
- GitHub Actions run [#22](https://github.com/Aditya-6286/Campus-Connect/actions/runs/40222193081) passed for Flutter source commit `985de8e99aa0e6c7d2dc9e8337d460f2f07c6bbe`: Dart basics example, `flutter analyze` (no issues), 11 unit/widget tests, and `flutter build web --release` all succeeded. Later `main` commits only changed documentation.
- Browser/device launch, responsive smoke testing on real viewports, live API/UI end-to-end behavior, and genuine screenshots are **not yet confirmed**.
- The repository contains the Flutter source package; Android/Web runners are generated in CI and are not committed. Local runners may be generated with `flutter create . --platforms=android,web` inside `flutter_app/`.

### Known demo limitations

- Events and Subjects use illustrative sample data.
- Notices use JSONPlaceholder as a demo REST endpoint, not an official college API.
- Profile details are validated but not persisted.
- CI results are recorded in the README and project report. Genuine screenshots from a running browser/device and manual smoke-test results are still needed before submission.
