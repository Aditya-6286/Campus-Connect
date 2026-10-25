# Campus Connect — Flutter Student Companion

Campus Connect is a Flutter demo application that brings common student-facing campus information into one mobile-friendly interface. It is being built against the **CS506PC UI Design–Flutter lab topics**, with each milestone tracked in GitHub.

## Student details

- **Student:** Tirumala Venkata Aditya
- **College:** ACE Engineering College
- **Branch:** Computer Science and Engineering
- **Expected graduation:** 2028
- **Project:** Campus Connect — College Student Companion App

## Current features

- Responsive Material 3 dashboard using `MediaQuery`, `LayoutBuilder`, and `Wrap`
- Named navigation for Events, Notices, Subjects, and Profile
- Searchable campus events with category filters and an empty-results state
- REST-backed sample notices with loading, error/retry, and refresh states
- Expandable subject cards (illustrative sample data)
- Student profile form with required-field validation
- Shared saved-section state using Provider and `ChangeNotifier`
- Animated bookmark feedback and a dashboard count of saved sections
- Unit/widget tests for state transitions, profile validation, event search, and API responses
- GitHub Actions workflow for `flutter analyze` and `flutter test`

## Syllabus-to-project mapping

| Lab topic / experiment | Campus Connect implementation | Status |
| --- | --- | --- |
| 1. Flutter/Dart foundation | Flutter package manifest and app entry point | Implemented |
| 2. Widgets and layouts | Material 3 dashboard, cards, lists, expansion tiles | Implemented |
| 3. Responsive UI | `MediaQuery`, `LayoutBuilder`, `Wrap`, scrollable screens | Implemented |
| 4. Navigation | Named routes, `Navigator.pushNamed`, back navigation | Implemented |
| 5. State management | `setState`, Provider, `ChangeNotifier`, saved sections | Implemented; tests added |
| 6. Custom widgets and themes | Reusable dashboard cards, bookmark action, Material 3 theme | Implemented |
| 7. Forms and validation | Student profile form with required-field validators | Implemented; tests added |
| 8. Animations | Animated bookmark icon using `AnimatedSwitcher` and `ScaleTransition` | Implemented |
| 9. REST API | Typed HTTP client and FutureBuilder notices screen | Implemented; mock tests added |
| 10. Unit/widget testing and debugging | Flutter widget/unit tests and CI workflow | Tests/workflow added; execution status pending |

> Confirm the table against the latest official lab manual before submission. Do not describe the project as runtime-tested until the CI checks or local Flutter commands have passed.

## Run the application

The repository currently contains the Flutter source package. If the platform folders have not been generated yet, create the Android and Web runners once:

```bash
cd flutter_app
flutter create . --platforms=android,web
flutter pub get
flutter analyze
flutter test
flutter run -d chrome
```

You can also use an Android emulator/device after setting up the Android SDK. The Notices screen calls the public JSONPlaceholder demo API and therefore needs internet access. Events and Subjects currently use clearly labelled sample content.

## Project documentation

- [Implementation report](docs/project-report.md)
- [Flutter development log](flutter_app/DEVELOPMENT_LOG.md)
- [API notes](docs/api-contract.md)
- [Project roadmap](docs/roadmap.md)

## Important limitations before release

- Event and subject records are sample data; replace them with college-approved content.
- The profile form validates fields and displays confirmation but does not yet persist profile data.
- Notices use a public demo REST endpoint rather than an official college API.
- Run the CI workflow and capture actual application screenshots before final submission.
