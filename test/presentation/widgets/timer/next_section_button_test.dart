import 'package:classroom_timer/presentation/widgets/timer/next_section_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('NextSectionButton displays correctly and handles tap', (WidgetTester tester) async {
    bool nextPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NextSectionButton(
            onPressed: () => nextPressed = true,
          ),
        ),
      ),
    );

    // Check texts
    expect(find.text('次のセクションへ'), findsOneWidget);
    expect(find.text('※ 次に進むと、残りの時間が以降のセクションに自動配分されます'), findsOneWidget);
    
    // Check icon
    expect(find.byIcon(Icons.arrow_forward_ios), findsOneWidget);

    // Tap button
    await tester.tap(find.byType(ElevatedButton)); // Assuming ElevatedButton is used as base
    expect(nextPressed, isTrue);
  });
}
