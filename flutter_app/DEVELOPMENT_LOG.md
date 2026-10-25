# Campus Connect Development Log

## Current milestone

The Flutter foundation, responsive dashboard, named-route navigation, and dashboard quick-access improvements are implemented.

### Completed

- Added the Flutter project manifest under `flutter_app/`.
- Built the home screen with Material widgets and reusable dashboard cards.
- Added responsive sizing with `MediaQuery`, `LayoutBuilder`, and `Wrap`.
- Added named routes for Events, Notices, Subjects, and Profile.
- Connected dashboard cards to their destinations with `Navigator.pushNamed`.
- Added a Back to Home action on each destination page using `Navigator.pop`.
- Applied a Material 3 color scheme seeded with the Campus Connect blue.
- Added an AppBar profile shortcut and labelled quick-access tiles for Events and Notices.
- Changed the dashboard content to a `ListView` to allow scrolling on shorter screens.
- Improved card hierarchy with subtitles and theme-based text styles.

### Syllabus mapping confirmed so far

- Experiment 1: Flutter/Dart project foundation.
- Experiment 2: Flutter widgets and layouts.
- Experiment 3: Responsive UI using `MediaQuery` and `LayoutBuilder`.
- Experiment 4: Screen navigation using `Navigator` and named routes.

The above mapping is limited to the experiments already documented in this repository. Confirm the official lab manual before adding topics for later experiments.

### Verification note

The source and route names were reviewed, and the updated file was verified on GitHub. A Flutter SDK was not available in this session, so `flutter analyze`, automated tests, and device testing have not been run.

### Next planned work

1. Confirm remaining experiments against the official lab manual.
2. Add a meaningful interactive state update only when it maps to a confirmed syllabus topic.
3. Run `flutter pub get`, `flutter analyze`, and app/device checks in a Flutter-enabled environment.
