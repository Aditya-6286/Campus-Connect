# Campus Connect — Project Report

**Course:** CS506PC — UI Design–Flutter  
**Project:** Campus Connect — College Student Companion App  
**Student:** Tirumala Venkata Aditya  
**College:** ACE Engineering College  
**Branch:** Computer Science and Engineering  
**Report date:** 25 October 2026  
**Repository:** https://github.com/Aditya-6286/Campus-Connect  
**Syllabus reference:** [Official JNTUH R22 B.Tech CSE syllabus, CS506PC, page 87](https://jntuh.ac.in/uploads/academics/R22B.Tech.CSECourseStructureSyllabus2.pdf)

> **Verification note:** CI passed for commit `055926c8d79369aaf2ae2b58127bf5acf3d4577c` (run #20). The current main commit `0d4be8d46842eae7554ce9da45e3c470ca5ea9e2` adds a bundled banner image and an image-widget assertion; its run #21 was still in progress when this report was updated. Results from run #20 must not be misrepresented as verification of the newer commit. No physical-device or real-browser smoke test has been recorded, and no genuine app screenshots have been captured.

## 1. Abstract

Campus Connect is a Flutter prototype that brings common campus information into a student-facing interface. It provides a responsive dashboard and named navigation to Events, Notices, Subjects, and Profile. Events supports search and category filtering; Notices demonstrates REST API consumption and loading/error states; Subjects uses expandable illustrative records; Profile demonstrates required-field validation. Provider and ChangeNotifier maintain in-memory saved-section state, and the bookmark action demonstrates fade, slide, and scale animation.

The project is intended to demonstrate the confirmed CS506PC Flutter lab experiments in one coherent prototype. It uses sample Events/Subjects content and a public demo API because an approved college data source is not available in this project.

## 2. Problem statement

Students may need to navigate multiple channels to locate campus activities, notices, and subject information. A compact companion interface can make these destinations easier to discover. The lab goal is to demonstrate Flutter widgets, layouts, responsiveness, navigation, state, custom widgets/themes, form validation, animation, REST requests, and tests without claiming integration with unavailable college systems.

## 3. Objectives

- Build a responsive Material 3 dashboard with a bundled campus banner.
- Demonstrate named-route navigation between app sections.
- Demonstrate local UI state and shared state management.
- Validate student profile input before showing a confirmation.
- Demonstrate an asynchronous REST API screen with loading, error, retry, and refresh states.
- Implement fade, slide, and scale animation for bookmark feedback.
- Add unit/widget tests and automated analysis/testing workflow.
- Document the implementation against the official CS506PC experiment list.

## 4. Scope

### Included
- Responsive dashboard using Material widgets and adaptive layout.
- Bundled image asset used by an `Image` widget.
- Events list with search and category filters.
- Notices screen consuming JSONPlaceholder demo data.
- Expandable sample subject cards.
- Student profile form with required-field validation.
- In-memory saved-section state using Provider/ChangeNotifier.
- Animated bookmark action with fade, slide, and scale transitions.
- Dart basics example, unit/widget tests, and GitHub Actions CI.

### Not included
- College authentication or student account integration.
- Persistent profile storage or a backend database.
- Official college notices/events API.
- Push notifications or live timetable synchronization.
- Production deployment, verified browser/device smoke test, or genuine screenshots.

## 5. Technologies

| Technology | Purpose |
| --- | --- |
| Flutter / Dart | Cross-platform UI and application logic |
| Material 3 | App theme and UI components |
| Provider / ChangeNotifier | Shared saved-section state |
| `http` package | REST requests and injectable HTTP client |
| `FutureBuilder` | Asynchronous loading/error/success UI |
| Flutter Test | Unit and widget test coverage |
| GitHub Actions | Automated Dart example, analysis, tests, and Web build |

## 6. Application architecture

- `flutter_app/lib/main.dart` — app theme, named routes, dashboard, and shared navigation.
- `flutter_app/assets/campus_connect_banner.png` — bundled campus banner used by `Image.asset`.
- `flutter_app/lib/screens/events_page.dart` — sample events, search, and category filtering.
- `flutter_app/lib/screens/notices_page.dart` — asynchronous notices, loading, retry, and refresh states.
- `flutter_app/lib/screens/profile_page.dart` — student details form and validation.
- `flutter_app/lib/screens/subjects_page.dart` — expandable subject information.
- `flutter_app/lib/services/campus_api.dart` — typed notice model and REST client.
- `flutter_app/lib/state/campus_state.dart` — in-memory saved-section names.
- `flutter_app/lib/widgets/favorite_section_action.dart` — reusable animated bookmark action.
- `flutter_app/tool/dart_basics.dart` — Dart language basics example.
- `flutter_app/test/` — tests for API parsing/errors, event filtering, profile validation, saved state, navigation, and animation.
- `.github/workflows/flutter-ci.yml` — automated validation workflow.

### Data flow

1. The dashboard opens a section through a named route.
2. A Provider-backed bookmark action toggles shared in-memory saved-section state.
3. Events are filtered locally as the student types or chooses a category.
4. Notices are requested by the API client; the screen renders loading, failure, empty, or populated states.
5. The profile form runs required-field validators before showing a confirmation message.

## 7. Feature description

### 7.1 Dashboard and navigation

The dashboard uses Text, Container, Image, cards, and Material components. Its adaptive layout uses `MediaQuery`, `LayoutBuilder`, `Wrap`, and a scrollable list. Row, Column, and Stack layouts are used across the app. Named routes connect Events, Notices, Subjects, and Profile.

### 7.2 Events

Events uses a local demonstration dataset. Students can search by event title, description, or location and narrow results using category chips. An empty state appears when no records match. Replace this content with approved campus events before a real release.

### 7.3 Notices and REST API

The API client requests a small list from JSONPlaceholder and converts the response to typed notice objects. It checks HTTP status and response shape and applies a request timeout. The UI displays loading, error/retry, empty, or populated states and supports refresh.

This is a lab demonstration, not a connection to an official college notice service. Internet access is required. CI tests cover successful JSON parsing, non-success HTTP status, and an unexpected response shape; a live end-to-end network/UI test is not claimed.

### 7.4 Subjects

Subjects uses expandable cards with illustrative subject descriptions. These are sample records, not an authoritative curriculum list, and should be replaced with approved content for the relevant academic term.

### 7.5 Profile form

Profile collects a name, student ID/roll number, and course/branch. Required-field validators run before confirmation. Controllers are disposed with the widget lifecycle. The current version does not persist profile information to a database or local storage.

### 7.6 Saved sections and animation

A shared ChangeNotifier stores saved section names. Provider makes this state available across the app, and the dashboard displays the saved-section count. The reusable bookmark action uses AnimatedSwitcher with FadeTransition, SlideTransition, and ScaleTransition. A widget test checks the animation wrappers and the updated saved/unsaved tooltip.

## 8. Confirmed syllabus mapping

The table follows the ten CS506PC experiments listed in the official JNTUH R22 B.Tech CSE syllabus linked above.

| Experiment | Implementation/evidence | Status and caveat |
| --- | --- | --- |
| 1(a). Install Flutter and Dart SDK | CI installs stable Flutter; local setup commands are documented | CI setup verified on run #20; local machine installation not verified |
| 1(b). Dart language basics | `tool/dart_basics.dart` | Passed on run #20 |
| 2(a). Flutter widgets (Text, Image, Container, etc.) | Dashboard includes Text, Container, bundled Image asset and Material components | Implemented in current commit; CI verification pending |
| 2(b). Row, Column, Stack layouts | Row on Events, Column on screens, Stack on dashboard | Implemented |
| 3(a–b). Responsive UI, media queries and breakpoints | MediaQuery, LayoutBuilder, Wrap, scrollable layouts | Implemented; no physical-device/browser smoke test recorded |
| 4(a–b). Navigator and named routes | Named routes and Navigator actions | Implemented; navigation test passed on run #20 |
| 5(a–b). Stateful/stateless widgets and state management | setState, Provider, ChangeNotifier | Implemented; state tests passed on run #20 |
| 6(a–b). Custom widgets, themes and styles | Reusable bookmark action, dashboard cards, Material 3 theme | Implemented |
| 7(a–b). Form fields, validation and error handling | Profile form and required-field validators | Implemented; profile tests passed on run #20 |
| 8(a–b). Animation framework; fade/slide animations | FadeTransition, SlideTransition, ScaleTransition | Implemented; animation test passed on run #20 |
| 9(a–b). REST API and meaningful UI display | Typed HTTP client and asynchronous Notices screen | API client tests passed on run #20; live network/UI flow not verified |
| 10(a–b). Unit tests and debugging | Flutter tests, analyzer, CI logs, Web release build | Run #20 passed; latest commit run #21 pending |

## 9. Testing and verification evidence

### Last completed successful run

**Run #20:** [GitHub Actions](https://github.com/Aditya-6286/Campus-Connect/actions/runs/40221893549)  
**Validated commit:** `055926c8d79369aaf2ae2b58127bf5acf3d4577c`

| Check | Recorded result |
| --- | --- |
| Flutter SDK setup | Passed |
| Generate Android/Web runners in CI workspace | Passed |
| Remove generated placeholder test | Passed |
| Install dependencies | Passed |
| Run Dart language basics example | Passed |
| `flutter analyze` | Passed — “No issues found!” |
| `flutter test` | Passed — 11 unit/widget test cases reported successful |
| `flutter build web --release` | Passed — Web release bundle built |

The 11 successful test cases covered event search and empty results, profile validation (invalid and valid submissions), saved-state toggling and notifications, bookmark fade/slide/scale transitions, dashboard navigation/shared state, and API success/error/response-shape handling.

### Current commit status

Current main commit: [`0d4be8d46842eae7554ce9da45e3c470ca5ea9e2`](https://github.com/Aditya-6286/Campus-Connect/commit/0d4be8d46842eae7554ce9da45e3c470ca5ea9e2)

Its workflow run is [Run #21](https://github.com/Aditya-6286/Campus-Connect/actions/runs/40222031795). It was still in progress at report-update time. This run includes the bundled banner asset and a widget assertion for the Image widget; do not infer its outcome from the preceding green run.

### Not yet verified

- Browser smoke test of the built app.
- Android emulator or physical-device execution.
- Actual responsive behavior on multiple device sizes.
- Genuine application screenshots for this report.
- Live JSONPlaceholder request and error-state behavior in an end-to-end run.

## 10. Setup and execution

From the repository root:

```bash
cd flutter_app
flutter create . --platforms=android,web
flutter pub get
flutter analyze
flutter test
flutter build web --release
flutter run -d chrome
```

For Android, configure the Android SDK and start an emulator or connect a device. The Android and Web runner folders are generated in CI and are not committed to the repository. A successful Web build proves compilation of the release bundle, not that a real browser/device smoke test was performed.

## 11. Limitations and future work

- Replace JSONPlaceholder with an official college API if one becomes available.
- Replace Events and Subjects sample records with approved campus data.
- Persist profile information and saved sections using an appropriate storage layer.
- Run the latest CI to completion and fix any failures before submission.
- Perform browser and Android device smoke tests.
- Capture genuine screenshots from the running app and insert them in the report/README.
- Review accessibility and responsive behavior on representative screen sizes.

## 12. Conclusion

Campus Connect combines the ten confirmed CS506PC lab themes in a student-facing Flutter prototype: widgets/layouts, responsive design, navigation, state, reusable widgets/themes, validation, animation, REST consumption, and tests. The last completed CI run passed analysis, 11 tests, the Dart basics example, and the Web release build. The newest banner-image commit still requires a green CI run and browser/device smoke testing before the project should be considered fully verified.
