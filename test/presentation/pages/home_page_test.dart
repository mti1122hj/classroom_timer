import 'package:classroom_timer/presentation/pages/home_page.dart';
import 'package:classroom_timer/presentation/providers/repository_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:classroom_timer/data/repositories/mock_class_session_repository.dart';

void main() {
  testWidgets('HomePage displays mock session types', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: HomePage(),
        ),
      ),
    );

    // Initial state might be loading, but MockRepository has a delay.
    // Pump for the delay duration + execution time.
    await tester.pumpAndSettle(const Duration(milliseconds: 600));

    // Verify that the title is displayed
    expect(find.text('授業を開始'), findsOneWidget);

    // Verify that all 3 mock items are displayed in the grid
    expect(find.text('通常授業'), findsOneWidget); // New design splits name
    expect(find.text('定期テスト'), findsOneWidget);
    expect(find.text('短縮授業'), findsOneWidget);

    // Verify duration is displayed
    expect(find.text('50分'), findsNWidgets(2)); // Normal and Test
    expect(find.text('45分'), findsOneWidget); // Short
  });
}
