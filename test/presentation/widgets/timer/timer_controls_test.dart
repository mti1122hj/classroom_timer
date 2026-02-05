import 'package:classroom_timer/presentation/widgets/timer/timer_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TimerControls interacts correctly', (WidgetTester tester) async {
    bool pausePressed = false;
    bool resetPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TimerControls(
            isRunning: true,
            onTogglePause: () => pausePressed = true,
            onReset: () => resetPressed = true,
          ),
        ),
      ),
    );

    // Verify buttons exist
    expect(find.text('一時停止'), findsOneWidget); // implies isRunning=true
    expect(find.text('+1分'), findsNothing); // Should be gone
    expect(find.text('リセット'), findsOneWidget);

    // Tap buttons
    await tester.tap(find.text('一時停止'));
    expect(pausePressed, isTrue);

    await tester.tap(find.text('リセット'));
    expect(resetPressed, isTrue);
  });

  testWidgets('TimerControls changes label when paused', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TimerControls(
            isRunning: false,
            onTogglePause: () {},
            onReset: () {},
          ),
        ),
      ),
    );

    expect(find.text('再開'), findsOneWidget); // or Start
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);
  });
}
