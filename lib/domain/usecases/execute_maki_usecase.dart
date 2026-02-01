import '../entities/classroom_timer.dart';
import '../entities/phase.dart';

class ExecuteMakiUseCase {
  /// 巻き（Maki）を実行し、残り時間に基づいてフェーズ時間を再配分した新しいTimerを返す
  ClassroomTimer call({
    required ClassroomTimer timer,
    required int elapsedTimeInMinutes,
    required int currentPhaseIndex,
  }) {
    // 1. 全体の残り時間を計算
    final remainingTime = timer.totalDurationMinutes - elapsedTimeInMinutes;
    if (remainingTime <= 0) {
      // 既に時間切れの場合は何もしない（あるいは残り0で埋めるなどの処理が必要だが、一旦そのまま返す）
      return timer;
    }

    // 2. 更新対象のフェーズ（現在進行中〜最後）を取得
    // 既に完了したフェーズ（currentPhaseIndex未満）は変更しない
    final targetPhases = timer.phases.sublist(currentPhaseIndex);
    
    // 3. 対象フェーズの元の合計予定時間を計算
    final originalTotalDuration = targetPhases.fold<int>(0, (sum, phase) => sum + phase.durationMinutes);
    
    if (originalTotalDuration <= 0) {
        return timer;
    }

    // 4. 新しい配分を計算
    // 各フェーズの比率を維持して remainingTime を分配する
    List<Phase> newPhases = List.from(timer.phases);
    int allocatedTime = 0;

    for (int i = 0; i < targetPhases.length; i++) {
      final phaseIndex = currentPhaseIndex + i;
      final phase = targetPhases[i];
      
      // 最後のフェーズの場合は、端数調整のため残り全てを割り当てる
      int newDuration;
      if (i == targetPhases.length - 1) {
        newDuration = remainingTime - allocatedTime;
      } else {
        // 比率計算: (対象フェーズの元時間 / 対象フェーズの元合計) * 残り時間
        // 四捨五入して整数にする
        double ratio = phase.durationMinutes / originalTotalDuration;
        newDuration = (remainingTime * ratio).round();
      }
      
      // 負にならないように補正（計算上ありえないはずだが安全策）
      if (newDuration < 0) newDuration = 0;

      allocatedTime += newDuration;
      
      // フェーズ更新
      newPhases[phaseIndex] = phase.copyWith(durationMinutes: newDuration);
    }
    
    return timer.copyWith(phases: newPhases);
  }
}
