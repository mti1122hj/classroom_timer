import 'package:classroom_timer/domain/entities/classroom_timer.dart';
import 'package:classroom_timer/domain/entities/phase.dart';
import 'package:classroom_timer/presentation/pages/timer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TimerPage displays all new components and start state', (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 1200));

    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: TimerPage(),
        ),
      ),
    );
    
    // Initial pump
    await tester.pump();
    await tester.pumpAndSettle();

    // Verify Header
    expect(find.text('授業タイマー'), findsOneWidget);
    
    // Verify Start State
    // "スタート" should be visible instead of time
    expect(find.text('スタート'), findsOneWidget); 
    // "再開" -> "再生" (initially stopped)
    expect(find.text('再生'), findsOneWidget);
    
    // Check Next Phase logic for start state
    // Real dummy data has title '導入' and duration 10 min
    expect(find.text('次は: 導入 (残り10分)'), findsOneWidget);

    // Verify Phase Title (Current Section)
    expect(find.text('導入'), findsOneWidget);
    
    // Tap Start on Circular Timer
    await tester.tap(find.text('スタート'));
    await tester.pump();
    
    // Verify state changes to Running
    // (Actual logic depends on TimerController implementation which uses Timer.periodic)
    // We can't easily wait for seconds in widget test without async lag.
    // But button should change to "一時停止" if isRunning becomes true immediate.
    // However, Controller.start() sets isRunning = true.
    
    await tester.pump(); 
    // Check if controls changed
    expect(find.text('一時停止'), findsOneWidget);
    
    // Check if "Start" text changed to time
    expect(find.text('スタート'), findsNothing);
    expect(find.text('10:00'), findsOneWidget);
  });
}
