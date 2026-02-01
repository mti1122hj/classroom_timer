import 'package:classroom_timer/domain/entities/classroom_timer.dart';
import 'package:classroom_timer/domain/entities/phase.dart';
import 'package:classroom_timer/domain/usecases/execute_maki_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ExecuteMakiUseCase useCase;

  setUp(() {
    useCase = ExecuteMakiUseCase();
  });

  group('ExecuteMakiUseCase', () {
    test('残り時間を比率に従って再配分する (正常系)', () {
      // 準備: 3つのフェーズ、計50分
      // Phase 1: 10分 (完了済)
      // Phase 2: 20分 (未完了)
      // Phase 3: 20分 (未完了)
      // 仮定: 現在 Phase 2 の途中、経過時間は 20分 (Phase1完了 + Phase2半分)
      // 残り時間 = 50 - 20 = 30分
      // 未完了フェーズの元合計 = 20 + 20 = 40分
      // Phase 2 の比率 = 20/40 = 0.5 -> 30 * 0.5 = 15分
      // Phase 3 の比率 = 20/40 = 0.5 -> 30 * 0.5 = 15分
      
      final phases = [
        const Phase(id: '1', title: 'Phase 1', durationMinutes: 10, sortOrder: 0),
        const Phase(id: '2', title: 'Phase 2', durationMinutes: 20, sortOrder: 1),
        const Phase(id: '3', title: 'Phase 3', durationMinutes: 20, sortOrder: 2),
      ];
      final timer = ClassroomTimer(
        id: 'timer1',
        title: 'Test Timer',
        totalDurationMinutes: 50,
        phases: phases,
      );

      // 実行: 現在フェーズインデックス=1 (Phase 2), 経過時間20分
      final result = useCase(
        timer: timer,
        elapsedTimeInMinutes: 20,
        currentPhaseIndex: 1,
      );

      // 検証
      expect(result.phases[0].durationMinutes, 10, reason: '完了済みのフェーズは変更されない');
      expect(result.phases[1].durationMinutes, 15, reason: '比率に従って短縮されるべき');
      expect(result.phases[2].durationMinutes, 15, reason: '比率に従って短縮されるべき');
      
      // 合計時間が残り時間(30分) + 完了時間(10分) = 40分 になるのではなく、あくまで各フェーズのdurationが変わるだけ
      // ただし、totalDurationMinutes は不変プロパティとしているが、
      // 実際は各フェーズの合計も変わるはず。
      // 仕様としては「物理的な残り時間を...再配分する」とあるので、
      // 結果的に totalDurationMinutes も変わるべきか、あるいは totalDurationMinutes は「当初の予定」として残すか？
      // 今回のUseCase実装では copyWith(phases: ...) しかしていないので、totalDurationMinutes はそのまま。
      // Appの挙動としては、これで「早まった終了時刻」に合わせることになるのか、
      // あるいは「残り時間」が変わるだけか。
      // ここではフェーズ時間の変更を確認する。
    });

    test('端数が出る場合、最後のフェーズで調整される', () {
      // 準備: 未完了フェーズが3つ、それぞれ10分、10分、10分 (計30分)
      // 残り時間が 20分になったとする。
      // 20 * (10/30) = 6.66... -> 7分 (四捨五入)
      // 20 * (10/30) = 6.66... -> 7分
      // 最後: 20 - (7 + 7) = 6分
      
      final phases = [
        const Phase(id: '1', title: 'P1', durationMinutes: 10),
        const Phase(id: '2', title: 'P2', durationMinutes: 10),
        const Phase(id: '3', title: 'P3', durationMinutes: 10),
      ];
      final timer = ClassroomTimer(
        id: 't1', 
        title: 'T1', 
        totalDurationMinutes: 30, 
        phases: phases,
      );

      // 経過時間10分、残り20分、現在インデックス0（最初から）
      // ※経過時間10分ということは、既に遅れている（本来なら30分残っているはずが20分しかない状況をシミュレートする場合、
      // elapsedTimeInMinutes = total - remaining であるべき。
      // ここでは elapsedTimeInMinutes を直接指定するので、
      // totalDurationMinutes=30, elapsedTime=10 => remaining=20.
      // 元の合計=30.
      
      final result = useCase(
        timer: timer,
        elapsedTimeInMinutes: 10, // 残り20分
        currentPhaseIndex: 0,
      );

      expect(result.phases[0].durationMinutes, 7);
      expect(result.phases[1].durationMinutes, 7);
      expect(result.phases[2].durationMinutes, 6); // 20 - 14 = 6
    });
  });
}
