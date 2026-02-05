import 'package:classroom_timer/presentation/widgets/timer/timer_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TimerHeader displays title and icons', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TimerHeader(),
        ),
      ),
    );

    // Verify title exists
    expect(find.text('授業タイマー'), findsOneWidget);

    // Verify icons exist (using Icons mapping roughly based on HTML content)
    // material-symbols-outlined 'timer' -> Icons.timer or similar check
    // material-symbols-outlined 'settings' -> Icons.settings
    expect(find.byIcon(Icons.timer_outlined), findsOneWidget);
    expect(find.byIcon(Icons.settings_outlined), findsOneWidget);
  });
}
