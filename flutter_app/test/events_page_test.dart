import 'package:campus_connect/screens/events_page.dart';
import 'package:campus_connect/state/campus_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  Widget buildTestApp() {
    return ChangeNotifierProvider(
      create: (_) => CampusState(),
      child: const MaterialApp(home: CampusEventsPage()),
    );
  }

  testWidgets('search filters campus events by title', (tester) async {
    await tester.pumpWidget(buildTestApp());

    await tester.enterText(find.byType(TextField), 'coding');
    await tester.pumpAndSettle();

    expect(find.text('Coding Challenge'), findsOneWidget);
    expect(find.text('Cultural Evening'), findsNothing);
  });

  testWidgets('shows an empty state when no event matches', (tester) async {
    await tester.pumpWidget(buildTestApp());

    await tester.enterText(find.byType(TextField), 'event-that-does-not-exist');
    await tester.pumpAndSettle();

    expect(find.text('No events match your search.'), findsOneWidget);
  });
}
