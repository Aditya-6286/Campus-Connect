import 'package:campus_connect/screens/events_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('search filters campus events by title', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: CampusEventsPage()),
    );

    await tester.enterText(find.byType(TextField), 'coding');
    await tester.pumpAndSettle();

    expect(find.text('Coding Challenge'), findsOneWidget);
    expect(find.text('Cultural Evening'), findsNothing);
  });

  testWidgets('shows an empty state when no event matches', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: CampusEventsPage()),
    );

    await tester.enterText(find.byType(TextField), 'event-that-does-not-exist');
    await tester.pumpAndSettle();

    expect(find.text('No events match your search.'), findsOneWidget);
  });
}
