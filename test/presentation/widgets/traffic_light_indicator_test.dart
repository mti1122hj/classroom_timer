import 'package:classroom_timer/presentation/widgets/traffic_light_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TrafficLightIndicator displays correct color based on remaining time', (tester) async {
    // 1. OK (緑): 残り > 1分 (例: 1分1秒)
    await tester.pumpWidget(const MaterialApp(
      home: TrafficLightIndicator(remaining: Duration(minutes: 1, seconds: 1)),
    ));
    final container = tester.widget<Container>(find.byType(Container));
    // Containerのcolorプロパティは直接取れない場合がある（Decoration経由など）、実装による。
    // ここではBoxDecorationのcolorを確認する想定。
    final decoration = container.decoration as BoxDecoration;
    expect(decoration.color, Colors.green);

    // 2. WARN (黄): 残り <= 1分 (例: 1分ジャスト)
    await tester.pumpWidget(const MaterialApp(
      home: TrafficLightIndicator(remaining: Duration(minutes: 1)),
    ));
    final containerWarn = tester.widget<Container>(find.byType(Container));
    final decorationWarn = containerWarn.decoration as BoxDecoration;
    expect(decorationWarn.color, Colors.yellow);

    // 3. CRITICAL (赤): 超過 (例: -1秒)
    await tester.pumpWidget(const MaterialApp(
      home: TrafficLightIndicator(remaining: Duration(seconds: -1)),
    ));
    final containerCritical = tester.widget<Container>(find.byType(Container));
    final decorationCritical = containerCritical.decoration as BoxDecoration;
    expect(decorationCritical.color, Colors.red);
  });
}
