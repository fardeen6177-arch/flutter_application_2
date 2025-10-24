import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';

void main() {
  testWidgets('Add button increases sandwich quantity',
      (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const App());

    // Verify initial text (quantity starts at 0)
    expect(find.text('0 Six-inch sandwich(es) on white bread'), findsOneWidget);

    // Tap the "Add" button (StyledButton with icon Icons.add)
    await tester.tap(find.widgetWithIcon(StyledButton, Icons.add));
    await tester.pump();

    // Verify quantity increased to 1
    expect(find.text('1 Six-inch sandwich(es) on white bread'), findsOneWidget);
  });

  testWidgets('Remove button decreases sandwich quantity',
      (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const App());

    // Tap "Add" once to go from 0 -> 1
    await tester.tap(find.widgetWithIcon(StyledButton, Icons.add));
    await tester.pump();

    // Now tap "Remove" to go back to 0
    await tester.tap(find.widgetWithIcon(StyledButton, Icons.remove));
    await tester.pump();

    // Verify quantity back to 0
    expect(find.text('0 Six-inch sandwich(es) on white bread'), findsOneWidget);
  });

  testWidgets('Add button disabled at max quantity',
      (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    // Press the Add button multiple times to reach max (5)
    for (int i = 0; i < 5; i++) {
      await tester.tap(find.widgetWithIcon(StyledButton, Icons.add));
      await tester.pump();
    }

    // Verify text shows max quantity
    expect(find.text('5 Six-inch sandwich(es) on white bread'), findsOneWidget);

    // Try tapping Add again (should be disabled — no change)
    await tester.tap(find.widgetWithIcon(StyledButton, Icons.add));
    await tester.pump();

    // Still should show 5
    expect(find.text('5 Six-inch sandwich(es) on white bread'), findsOneWidget);
  });
}
