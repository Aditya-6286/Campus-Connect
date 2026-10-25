# Campus Connect — Flutter Student Companion

Campus Connect is a Flutter prototype that brings common student-facing campus information into one responsive interface. Its lab mapping follows the official [JNTUH R22 B.Tech CSE syllabus, CS506PC: UI Design–Flutter (page 87)](https://jntuh.ac.in/uploads/academics/R22B.Tech.CSECourseStructureSyllabus2.pdf).

## Student details

- **Student:** Tirumala Venkata Aditya
- **College:** ACE Engineering College
- **Branch:** Computer Science and Engineering
- **Expected graduation:** 2028
- **Project:** Campus Connect — College Student Companion App

## Current features

- Responsive Material 3 dashboard using `MediaQuery`, `LayoutBuilder`, and `Wrap`
- Bundled campus banner image using `Image.asset`
- Named navigation for Events, Notices, Subjects, and Profile
- Searchable campus events with category filters and an empty-results state
- Notices screen with loading, error/retry, and refresh states, using the JSONPlaceholder demo API
- Expandable subject cards using illustrative sample data
- Student profile form with required-field validation
- Shared saved-section state using Provider and `ChangeNotifier`
- Bookmark animation with fade, slide, and scale transitions
- Dart language basics example executed by CI
- Unit/widget tests for event filtering, profile validation, shared state, API response handling, navigation, and bookmark animation
- GitHub Actions workflow for analysis, tests, and a Web release build

## Syllabus-to-project mapping

| Official experiment | Implementation and evidence | Status / caveat |
| --- | --- | --- |
| 1(a). Install Flutter and Dart SDK | CI installs stable Flutter; local setup commands below | CI setup is automated; local machine setup is not verified here |
| 1(b). Dart language basics | `flutter_app/tool/dart_basics.dart` | Passed in the last completed green CI run |
| 2(a). Widgets including Text, Image, Container | Dashboard uses Text, a bundled Image asset, Container and Material components | Implemented |
| 2(b). Row, Column, Stack layouts | Row on Events; Column on app screens; Stack on dashboard | Implemented |
| 3(a–b). Responsive UI, media queries and breakpoints | `MediaQuery`, `LayoutBuilder`, `Wrap`, scrollable layouts | Implemented; physical-device/browser behavior not yet smoke-tested |
| 4(a–b). Navigator and named routes | Named routes and Navigator actions in `lib/main.dart` | Implemented; navigation widget test |
| 5(a–b). Stateful/stateless widgets and state management | `setState`, Provider, `ChangeNotifier` | Implemented; state tests |
| 6(a–b). Custom widgets, themes and styles | Reusable bookmark action, dashboard cards, Material 3 theme | Implemented |
| 7(a–b). Form fields, validation and error handling | Profile form with required-field validators | Implemented; widget tests |
| 8(a–b). Animation framework; fade/slide animations | `AnimatedSwitcher` with fade, slide and scale transitions | Implemented; animation widget test |
| 9(a–b). REST API and meaningful display | Typed HTTP client and asynchronous Notices UI | Client tests pass; live API/UI flow not end-to-end verified |
| 10(a–b). Unit tests and debugging | Flutter tests, `flutter analyze`, CI logs and Web release build | Last completed run passed; latest asset-change run is pending |

## Verification status

- **Latest Flutter source commit verified by CI:** [`985de8e`](https://github.com/Aditya-6286/Campus-Connect/commit/985de8e99aa0e6c7d2dc9e8337d460f2f07c6bbe), [Run #22](https://github.com/Aditya-6286/Campus-Connect/actions/runs/40222193081) — **passed**.
- Run #22 reported **no analyzer issues**, passed the Dart basics example, passed **11 unit/widget test cases**, and built the Web release successfully.
- The preceding banner-image commit failed with `Invalid image data`; the asset was replaced with a locally validated PNG in commit `985de8e`, and the new asset then passed the widget test and Web build. A real browser/device smoke test is still not recorded.

## Run the application

The repository keeps the Flutter source package; Android/Web runners are generated in the CI workspace and are not committed. From the repository root:

```bash
cd flutter_app
flutter create . --platforms=android,web
flutter pub get
flutter analyze
flutter test
flutter build web --release
flutter run -d chrome
```

For Android execution, configure the Android SDK and launch an emulator or connect a device. A successful Web build does not by itself prove a browser/device smoke test was completed.

## Project documentation

- [Implementation report](docs/project-report.md)
- [Flutter development log](flutter_app/DEVELOPMENT_LOG.md)
- [API notes](docs/api-contract.md)
- [Project roadmap](docs/roadmap.md)

## Limitations before final submission

- Events and Subjects use sample data, not an official college data source.
- Notices use the public JSONPlaceholder demo API, not an official college service; internet access is required.
- Profile details are validated and confirmed in the UI but are not persisted.
- Saved-section state is in-memory and resets when the app restarts.
- Platform runners are generated in CI and are not tracked in the repository.
- No genuine screenshots from a running browser/device have been captured yet.
- Browser/device smoke testing and final validation of the latest commit are still required.
