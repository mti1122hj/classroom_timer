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
}
