# Campus Connect — Project Report

**Course:** CS506PC — UI Design (Flutter)  
**Project:** Campus Connect — College Student Companion App  
**Student:** Tirumala Venkata Aditya  
**College:** ACE Engineering College  
**Branch:** Computer Science and Engineering  
**Report date:** 25 October 2026  
**Repository:** https://github.com/Aditya-6286/Campus-Connect

> **Verification status:** This report documents the implementation currently present in the repository. The GitHub Actions workflow has been added, but its final run and a real-device/browser run must be checked before claiming that runtime testing passed. Screenshots should be inserted after running the app.

## 1. Abstract

Campus Connect is a Flutter application prototype intended to make common campus information easier for students to access. It provides a responsive dashboard with navigation to Events, Notices, Subjects, and Profile. The Events screen supports searching and category filtering, Notices demonstrates REST API consumption with loading and error states, Subjects displays expandable sample subject cards, and Profile demonstrates form validation. Provider and ChangeNotifier maintain saved-section state across the app, with animated bookmark feedback.

The project is structured to demonstrate core Flutter UI lab concepts in a single coherent student-facing application. Sample data and a public demo API are used where an official college data source is not available.

## 2. Problem statement

Students often need to move between separate channels to find campus activities, notices, and subject information. A compact student companion interface can make these common destinations easier to discover. For this lab prototype, the goal is to demonstrate the UI, navigation, state, form, animation, API, and testing concepts from the Flutter syllabus without claiming integration with college systems that are not available.

## 3. Objectives

- Build a clean, responsive Flutter dashboard.
- Demonstrate named-route navigation between app sections.
- Demonstrate local UI state and shared state management.
- Validate student profile input before showing a confirmation.
- Demonstrate an asynchronous REST API screen with loading, error, retry, and refresh states.
- Add unit/widget tests and automated analysis/testing workflow.
- Maintain readable Git history and document the syllabus mapping.

## 4. Scope

### Included

- Responsive Material 3 dashboard.
- Events list with text search and category chips.
- Notices screen consuming a sample REST endpoint.
- Expandable sample subject cards.
- Student profile form with required-field validation.
- Saved-section bookmark state using Provider/ChangeNotifier.
- Unit and widget test source files.
- GitHub Actions workflow for analysis and tests.

### Not included yet

- College authentication or student account integration.
- Persistent profile storage or a backend database.
- An official college notices/events API.
- Push notifications, live timetable synchronization, or administrative tools.
- Production deployment and verified screenshots.

## 5. Technologies

| Technology | Purpose |
| --- | --- |
| Flutter / Dart | Cross-platform UI and application logic |
| Material 3 | Consistent app theme and reusable UI components |
| Provider / ChangeNotifier | Shared saved-section state |
| `http` package | REST requests and injectable HTTP client |
| `FutureBuilder` | Asynchronous loading/error/success UI |
| Flutter Test | Unit and widget test coverage |
| GitHub Actions | Repeatable analysis and test workflow |

## 6. Application architecture

The Flutter source is organized into small, purpose-focused units:

- `lib/main.dart` — app theme, named routes, dashboard, and shared navigation.
- `lib/screens/events_page.dart` — sample events, search, and category filtering.
- `lib/screens/notices_page.dart` — asynchronous notice list, loading, retry, and refresh states.
- `lib/screens/profile_page.dart` — student details form and validation.
- `lib/screens/subjects_page.dart` — expandable subject information.
- `lib/services/campus_api.dart` — typed notice model and REST client.
- `lib/state/campus_state.dart` — shared set of saved section names.
- `lib/widgets/favorite_section_action.dart` — reusable animated bookmark action.
- `test/` — profile, event search, API, and state tests.
- `.github/workflows/flutter-ci.yml` — automated analysis and test job.

### Data flow

1. The dashboard opens a section through a named route.
2. The student can save or unsave sections through a shared Provider-backed action.
3. Events are filtered locally as the student types or chooses a category.
4. Notices are requested by the API client; the screen renders loading, failure, empty, or populated states.
5. The profile form runs required-field validators before showing a confirmation message.

## 7. Feature description

### 7.1 Dashboard and navigation

The dashboard uses Material 3 widgets, adaptive text sizing through `MediaQuery`, width-aware layout through `LayoutBuilder`, and `Wrap` for card placement. A `ListView` keeps the content scrollable on shorter screens. Named routes connect the Events, Notices, Subjects, and Profile destinations.

### 7.2 Events

The Events screen uses a local demonstration dataset. Students can search by event title, description, or location and narrow the list using category chips. An empty state appears when no records match. The content is sample data and should be replaced with official campus events before a real release.

### 7.3 Notices and REST API

The API client requests a small list from JSONPlaceholder and converts the response to typed notice objects. It checks the HTTP status and response shape and applies a request timeout. The UI displays a loading indicator, an error/retry state, an empty state, or the notices list. Pull-to-refresh and a refresh button allow another request.

This is a lab demonstration of REST integration, not a connection to an official college notice service. Network access is required for the sample notices.

### 7.4 Subjects

The Subjects screen uses expandable cards to show concise subject descriptions. The records are illustrative sample data; they must be replaced with the approved subject list for the relevant academic term.

### 7.5 Profile form

The Profile screen collects a name, student ID/roll number, and course/branch. Each field has a required-field validator. The controllers are disposed of with the widget lifecycle. After valid input, a confirmation message is shown. The current version does not persist the profile to a database or local storage.

### 7.6 Saved sections and animation

A shared `CampusState` ChangeNotifier stores saved section names. The Provider makes this state available across the app, and the dashboard displays the number of saved sections. A reusable bookmark action uses `AnimatedSwitcher` and `ScaleTransition` to animate the state change.

## 8. Syllabus mapping

The mapping below follows the CS506PC UI Design–Flutter experiment topics previously identified for this project. Cross-check experiment numbers and titles with the official lab manual before submission.

| Experiment/topic | Implementation | Evidence file(s) | Status |
| --- | --- | --- | --- |
| 1. Flutter/Dart foundation | App entry point and package manifest | `lib/main.dart`, `pubspec.yaml` | Implemented |
| 2. Widgets and layouts | Cards, lists, expansion tiles, forms | `lib/main.dart`, `lib/screens/` | Implemented |
| 3. Responsive UI | `MediaQuery`, `LayoutBuilder`, `Wrap`, scrollable layouts | `lib/main.dart` | Implemented |
| 4. Navigation | Named routes and Navigator actions | `lib/main.dart` | Implemented |
| 5. State management | `setState`, Provider, ChangeNotifier | `lib/screens/events_page.dart`, `lib/state/campus_state.dart` | Implemented; tests added |
| 6. Custom widgets and themes | Material 3 theme and reusable bookmark widget | `lib/main.dart`, `lib/widgets/favorite_section_action.dart` | Implemented |
| 7. Forms and validation | Required-field profile form | `lib/screens/profile_page.dart` | Implemented; tests added |
| 8. Animations | Animated bookmark transition | `lib/widgets/favorite_section_action.dart` | Implemented |
| 9. REST API | Typed HTTP client and asynchronous notices UI | `lib/services/campus_api.dart`, `lib/screens/notices_page.dart` | Implemented; mock tests added |
| 10. Unit/widget testing and debugging | Tests and CI workflow | `test/`, `.github/workflows/flutter-ci.yml` | Test source/workflow added; execution pending |

## 9. Testing plan and evidence

Test source has been added for:

- Required-field validation on an empty profile submission.
- Successful profile validation.
- Event search matching and empty-result behavior.
- Saved-section toggling and ChangeNotifier notifications.
- REST response parsing, non-success HTTP status, and malformed JSON shape.

The GitHub Actions workflow runs:

1. `flutter pub get`
2. `flutter analyze`
3. `flutter test`

**Do not mark these checks as passed until the workflow run or local terminal output confirms success.** No device/browser screenshots or runtime results are asserted in this report yet.

## 10. Setup and execution

The repository currently contains the Flutter source package. From the repository root, run:

```bash
cd flutter_app
flutter create . --platforms=android,web
flutter pub get
flutter analyze
flutter test
flutter run -d chrome
```

For Android execution, configure the Android SDK and launch an emulator or connect a device. The Notices screen needs an internet connection.

## 11. Limitations and future work

- Replace the JSONPlaceholder endpoint with an official college API when available.
- Replace sample Events and Subjects data with approved campus records.
- Persist profile information and saved sections using a suitable storage layer.
- Add actual screenshots from the running app to the report and README.
- Confirm all experiment titles and numbers against the official lab manual.
- Review accessibility, responsive behavior, error handling, and dependency versions after running the app.
- Capture the final GitHub Actions result and fix any analyzer or test failures before submission.

## 12. Conclusion

Campus Connect brings several Flutter UI lab concepts together in a student-facing prototype: responsive layouts, named navigation, local and shared state, form validation, animation, REST consumption, and tests. The repository includes implementation notes and a CI workflow to support verification. Before final submission, run the app and CI checks, add screenshots, and replace sample content where official campus data is required.
