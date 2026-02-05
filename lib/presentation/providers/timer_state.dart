import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/classroom_timer.dart';

part 'timer_state.freezed.dart';

@freezed
class TimerState with _$TimerState {
  const factory TimerState({
    ClassroomTimer? currentTimer,
    @Default(Duration.zero) Duration elapsedTime,
    @Default(false) bool isRunning,
    @Default(0) int currentPhaseIndex,
  }) = _TimerState;
  
  const TimerState._();
  
  // 残り時間を計算するヘルパー
  Duration get remainingTime {
    if (currentTimer == null) return Duration.zero;
    final total = Duration(minutes: currentTimer!.totalDurationMinutes);
    return total - elapsedTime;
  }
  
  // 現在のセクション(フェーズ)の残り時間を計算
  // (現在のフェーズまでの累積時間) - (全体の経過時間)
  // ただし負になる場合は 0 を返す（あるいはマイナス表示も許容するかは要件次第だが、一旦0）
  // -> マイナスもありえる（押し時間がわかるように）
  Duration get currentSectionRemainingTime {
    if (currentTimer == null) return Duration.zero;
    
    // 現在のフェーズを含めた累積時間を計算
    int cumulativeMinutes = 0;
    for (int i = 0; i <= currentPhaseIndex; i++) {
        if (i < currentTimer!.phases.length) {
            cumulativeMinutes += currentTimer!.phases[i].durationMinutes;
        }
    }
    
    final sectionFinishTime = Duration(minutes: cumulativeMinutes);
    return sectionFinishTime - elapsedTime;
  }
}
