import 'package:campus_connect/state/campus_state.dart';
import 'package:campus_connect/widgets/favorite_section_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('bookmark change uses fade and scale transitions',
      (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CampusState(),
        child: const MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              actions: [FavoriteSectionAction(section: 'Events')],
            ),
          ),
        ),
      ),
    );

    expect(find.byTooltip('Save section'), findsOneWidget);

    await tester.tap(find.byTooltip('Save section'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 110));

    expect(find.byType(FadeTransition), findsWidgets);
    expect(find.byType(ScaleTransition), findsWidgets);

    await tester.pumpAndSettle();
    expect(find.byTooltip('Remove saved section'), findsOneWidget);
  });
}
