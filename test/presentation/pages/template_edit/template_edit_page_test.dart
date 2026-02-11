import 'package:classroom_timer/presentation/pages/template_edit/template_edit_page.dart';
import 'package:classroom_timer/presentation/pages/template_edit/template_edit_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:classroom_timer/domain/entities/class_session_type.dart';
import 'package:classroom_timer/domain/repositories/class_session_repository.dart';
import 'package:classroom_timer/data/providers/repository_providers.dart';

class FakeClassSessionRepository implements ClassSessionRepository {
  int saveCallCount = 0;

  @override
  Future<void> saveClassSessionType(ClassSessionType classSessionType) async {
    saveCallCount++;
  }
  
  @override
  Future<void> deleteClassSessionType(String id) async {}

  @override
  Future<List<ClassSessionType>> getClassSessionTypes() async => [];

  @override
  Future<ClassSessionType?> getClassSessionTypeById(String id) async => null;
}

void main() {
  Widget createWidgetUnderTest({FakeClassSessionRepository? repo}) {
    return ProviderScope(
      overrides: [
        classSessionRepositoryProvider.overrideWith((ref) => repo ?? FakeClassSessionRepository()),
      ],
      child: const MaterialApp(
        home: TemplateEditPage(),
      ),
    );
  }

  testWidgets('TemplateEditPage shows title and save button', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('授業内容の編集'), findsOneWidget);
    expect(find.text('保存'), findsOneWidget);
    expect(find.text('完了'), findsNothing);
    expect(find.text('この構成を保存する'), findsNothing);
  });

  testWidgets('TemplateEditPage shows stats summary (only total time)', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('合計時間'), findsOneWidget);
    expect(find.text('残り時間'), findsNothing); // Removed
    expect(find.text('50'), findsOneWidget);
  });

  testWidgets('TemplateEditPage allows editing template name', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('テンプレート名'), findsOneWidget);
    
    await tester.enterText(find.byType(TextFormField).first, 'テスト授業');
    await tester.pump();

    expect(find.text('テスト授業'), findsOneWidget);
  });

  testWidgets('TemplateEditPage shows segment list without details', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('導入'), findsOneWidget);
    expect(find.text('詳細を入力'), findsNothing); // Removed
  });

  testWidgets('Can delete segment', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('導入'), findsOneWidget);

    // Tap delete on the first item
    await tester.tap(find.byIcon(Icons.delete_outline).first);
    await tester.pumpAndSettle();

    expect(find.text('導入'), findsNothing);
  });

  testWidgets('Can add new segment', (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(1080, 5000); // Extremely tall to avoid scrolling issues
    tester.binding.window.devicePixelRatioTestValue = 3.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

    await tester.pumpWidget(createWidgetUnderTest());

    await tester.pumpWidget(createWidgetUnderTest());

    // Initial check: 4 segments + 1 template name
    // 4 segments * 2 fields + 1 template name = 9 fields
    expect(find.byType(TextFormField), findsNWidgets(9));

    // Tap Add
    await tester.tap(find.text('セクションを追加'));
    await tester.pumpAndSettle();

    // Check count increased by 2 (1 title + 1 duration) -> 11 fields
    expect(find.byType(TextFormField), findsNWidgets(11));

    // Verify that we have exactly one TextFormField with an explicitly provided empty controller
    // (The new segment title).
    // Note: Template Name field uses initialValue, so its controller property is null.
    // Existing segments have non-empty titles.
    final textFields = tester.widgetList<TextFormField>(find.byType(TextFormField));
    final emptyControllerFields = textFields.where((tf) => 
      tf.controller != null && tf.controller!.text.isEmpty
    ).toList();
    
    expect(emptyControllerFields.length, 1, reason: 'Should have exactly one segment with empty title');

  });

  testWidgets('TemplateEditPage shows validation error when saving with empty name', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    // Initial state is empty name
    expect(find.text('テンプレート名を入力してください'), findsNothing);

    // Tap Save
    await tester.tap(find.text('保存'));
    await tester.pumpAndSettle();

    // Verification
    expect(find.text('テンプレート名を入力してください'), findsOneWidget);
  });

  testWidgets('Total duration updates when segment duration changes', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    // Initial total: 50
    expect(find.text('50'), findsOneWidget);

    // Increase first segment duration (5 -> 6)
    // Find the first "add" icon button.
    // Note: The structure in _buildIconButton is InkWell -> Container -> Icon.
    // finding by Icon(Icons.add) should work if there's only one type of add button or we pick the first one which corresponds to the first item (Introduction).
    await tester.tap(find.byIcon(Icons.add).first);
    await tester.pumpAndSettle();

    // Total should be 51
    expect(find.text('51'), findsOneWidget);

    // Segment duration should be updated to 6
    // Note: We need to find the text field that contained '5' and now should contain '6'.
    // Or just find text '6' in the duration fields.
    // Since '6' might appear elsewhere, let's look for a TextFormField with text '6'.
    // The previous value was 5.
    expect(find.widgetWithText(TextFormField, '6'), findsOneWidget);
  });

  testWidgets('TemplateEditPage shows error when saving with 0 total duration', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    // Reduce all durations to 0
    // Currently 4 items: 5, 25, 15, 5. Total 50.
    // We need to tap "remove" button (-) until they are 0.
    // Or easier: delete all segments and try to save (total 0).
    
    // Find all delete buttons and tap them one by one
    // Note: re-finding widgets after pumpAndSettle is safer as the widget tree changes.
    while (find.byIcon(Icons.delete_outline).evaluate().isNotEmpty) {
      await tester.tap(find.byIcon(Icons.delete_outline).first);
      await tester.pumpAndSettle();
    }

    // Verify total is 0
    expect(find.text('0'), findsOneWidget);

    // Tap Save
    await tester.tap(find.text('保存'));
    await tester.pump(); // SnackBar animation

    // Verification: SnackBar should be visible
    expect(find.text('合計時間が0分のテンプレートは保存できません'), findsOneWidget);
  });
}
