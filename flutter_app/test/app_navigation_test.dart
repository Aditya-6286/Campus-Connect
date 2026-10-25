import 'package:campus_connect/main.dart' as campus;
import 'package:campus_connect/state/campus_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('dashboard navigation shares saved state across screens',
      (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CampusState(),
        child: const campus.CampusConnectApp(),
      ),
    );

    expect(find.text('Welcome to Campus Connect'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);

    await tester.tap(find.text('Events').first);
    await tester.pumpAndSettle();
    expect(find.text('Campus Events'), findsOneWidget);

    await tester.tap(find.byTooltip('Save section'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back).first);
    await tester.pumpAndSettle();

    expect(find.text('1 section(s) saved'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.text('Subjects').first);
    await tester.pumpAndSettle();
    expect(find.text('Learning hub'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.arrow_back).first);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Profile').first);
    await tester.pumpAndSettle();
    expect(find.text('Student Profile'), findsOneWidget);
  });
}
