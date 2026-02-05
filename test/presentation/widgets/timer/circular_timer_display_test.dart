import 'package:classroom_timer/presentation/widgets/timer/circular_timer_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CircularTimerDisplay shows Start text when not started', (WidgetTester tester) async {
    bool started = false;
    
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CircularTimerDisplay(
            phaseTitle: '導入',
            remaining: const Duration(minutes: 10),
            total: const Duration(minutes: 10),
            hasStarted: false,
            onStart: () => started = true,
          ),
        ),
      ),
    );

    // Check Start text
    expect(find.text('スタート'), findsOneWidget);
    expect(find.text('10:00'), findsNothing);

    // Tap to start
    await tester.tap(find.text('スタート'));
    await tester.pump(); // Start animation
    await tester.pump(const Duration(milliseconds: 300)); // Advance animation
    
    expect(started, isTrue);
  });

  testWidgets('CircularTimerDisplay shows time when started', (WidgetTester tester) async {
    const remaining = Duration(minutes: 9, seconds: 30);
    
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CircularTimerDisplay(
            phaseTitle: '導入',
            remaining: remaining,
            total: Duration(minutes: 10),
            hasStarted: true,
          ),
        ),
      ),
    );

    expect(find.text('スタート'), findsNothing);
    expect(find.text('09:30'), findsOneWidget);
  });
}
