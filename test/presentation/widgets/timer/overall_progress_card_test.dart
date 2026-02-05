import 'package:classroom_timer/presentation/widgets/timer/overall_progress_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('OverallProgressCard displays progress info based on duration', (WidgetTester tester) async {
    const total = Duration(minutes: 50);
    const elapsed = Duration(minutes: 25);
    // 50%.
    
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: OverallProgressCard(
            elapsed: elapsed,
            total: total,
            nextPhaseTitle: 'まとめ',
            nextPhaseRemaining: Duration(minutes: 15),
          ),
        ),
      ),
    );

    // Check title
    expect(find.text('全体の進捗'), findsOneWidget);
    
    // Check time display
    expect(find.text('25 / 50 min'), findsOneWidget);
    
    // Check status text
    expect(find.text('オンスケジュール'), findsOneWidget);

    // Check next phase info
    expect(find.text('次は: まとめ (残り15分)'), findsOneWidget);
  });
}
