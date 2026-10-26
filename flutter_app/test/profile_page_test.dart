import 'package:shared_preferences/shared_preferences.dart';
import 'package:campus_connect/screens/profile_page.dart';
import 'package:campus_connect/state/campus_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });
  Widget buildTestApp() {
    return ChangeNotifierProvider(
      create: (_) => CampusState(),
      child: const MaterialApp(home: CampusProfilePage()),
    );
  }

  group('CampusProfilePage validation', () {
    testWidgets('shows required-field errors for an empty submission',
        (tester) async {
      await tester.pumpWidget(buildTestApp());
      await tester.pumpAndSettle();

      await tester.drag(find.byType(ListView), const Offset(0, -180));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Save profile'));
      await tester.pumpAndSettle();

      expect(find.text('Enter your full name'), findsOneWidget);
      expect(find.text('Enter your student ID'), findsOneWidget);
      expect(find.text('Enter your course'), findsOneWidget);
    });

    testWidgets('saves completed profile details locally',
        (tester) async {
      await tester.pumpWidget(buildTestApp());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField).at(0), 'Asha Rao');
      await tester.enterText(find.byType(TextFormField).at(1), 'CS-101');
      await tester.enterText(find.byType(TextFormField).at(2), 'CSE');
      await tester.drag(find.byType(ListView), const Offset(0, -180));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Save profile'));
      await tester.pumpAndSettle();

      expect(
        find.text('Profile details validated for Asha Rao.'),
        findsOneWidget,
      );
      expect(find.text('Enter your full name'), findsNothing);
    });
  });
}
