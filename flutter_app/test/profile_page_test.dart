import 'package:campus_connect/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildTestApp() {
    return const MaterialApp(home: CampusProfilePage());
  }

  group('CampusProfilePage validation', () {
    testWidgets('shows required-field errors for an empty submission',
        (tester) async {
      await tester.pumpWidget(buildTestApp());

      await tester.tap(find.text('Validate profile'));
      await tester.pumpAndSettle();

      expect(find.text('Enter your full name'), findsOneWidget);
      expect(find.text('Enter your student ID'), findsOneWidget);
      expect(find.text('Enter your course'), findsOneWidget);
    });

    testWidgets('accepts completed fields and confirms validation',
        (tester) async {
      await tester.pumpWidget(buildTestApp());

      await tester.enterText(find.byType(TextFormField).at(0), 'Asha Rao');
      await tester.enterText(find.byType(TextFormField).at(1), 'CS-101');
      await tester.enterText(find.byType(TextFormField).at(2), 'CSE');
      await tester.tap(find.text('Validate profile'));
      await tester.pumpAndSettle();

      expect(
        find.text('Profile details validated for Asha Rao.'),
        findsOneWidget,
      );
      expect(find.text('Enter your full name'), findsNothing);
    });
  });
}
