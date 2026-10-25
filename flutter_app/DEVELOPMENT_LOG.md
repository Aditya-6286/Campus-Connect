# Campus Connect Development Log

## Current milestone

The Flutter foundation, responsive home dashboard, and named-route navigation are implemented.

### Completed

- Added the Flutter project manifest under `flutter_app/`.
- Built the home screen with Material widgets and reusable dashboard cards.
- Added responsive sizing with `MediaQuery`, `LayoutBuilder`, and `Wrap`.
- Added named routes for Events, Notices, Subjects, and Profile.
- Connected each dashboard card to its destination with `Navigator.pushNamed`.
- Added a Back to Home button on each destination page using `Navigator.pop`.

### Syllabus mapping

- Experiment 1: Flutter/Dart project foundation.
- Experiment 2: Flutter widgets and layouts.
- Experiment 3: Responsive UI using `MediaQuery` and `LayoutBuilder`.
- Experiment 4: Screen navigation using `Navigator` and named routes.

### Verification note

The source changes were reviewed against the existing Flutter code. A Flutter SDK was not available in this GitHub-only session, so `flutter analyze` and device testing have not been run yet.

### Next planned work

1. Confirm the remaining experiments against the official lab manual.
2. Add syllabus-aligned state updates with `setState()` where useful.
3. Continue with custom widgets/themes and forms, based on the actual syllabus.
