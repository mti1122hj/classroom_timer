import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/classroom_timer.dart';
import '../../domain/usecases/execute_maki_usecase.dart';
import 'timer_state.dart';

part 'timer_controller.g.dart';

@riverpod
class TimerController extends _$TimerController {
  late ExecuteMakiUseCase _executeMakiUseCase;
  Timer? _ticker;

  @override
  TimerState build() {
    _executeMakiUseCase = ExecuteMakiUseCase();
    
    ref.onDispose(() {
      _ticker?.cancel();
    });
    
    return const TimerState();
  }

  void loadTimer(ClassroomTimer timer) {
    // 既存のタイマーを読み込み、状態をリセット
    _ticker?.cancel();
    state = state.copyWith(
      currentTimer: timer,
      elapsedTime: Duration.zero,
      isRunning: false,
      currentPhaseIndex: 0,
    );
  }

  void start() {
    if (state.isRunning || state.currentTimer == null) return;
    
    state = state.copyWith(isRunning: true);
    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!state.isRunning) {
        timer.cancel();
        return;
      }
      // 1秒加算
      final newElapsed = state.elapsedTime + const Duration(seconds: 1);
      state = state.copyWith(elapsedTime: newElapsed);
      
      // ここでフェーズ完了判定なども可能だが一旦省略
    });
  }

  void pause() {
    state = state.copyWith(isRunning: false);
    _ticker?.cancel();
  }

  void reset() {
    _ticker?.cancel();
    state = state.copyWith(
      elapsedTime: Duration.zero,
      isRunning: false,
      currentPhaseIndex: 0,
    );
  }

  void executeMaki() {
    if (state.currentTimer == null) return;

    // UseCase呼び出し
    // 分単位での調整ロジックを使用
    final newTimer = _executeMakiUseCase(
      timer: state.currentTimer!,
      elapsedTimeInMinutes: state.elapsedTime.inMinutes,
      currentPhaseIndex: state.currentPhaseIndex,
    );

    // タイマー定義を更新（各フェーズの所要時間が変わる）
    state = state.copyWith(currentTimer: newTimer);
    
    // 注: 経過時間はリセットせず、そのまま計測継続
  }

  void nextPhase() {
    if (state.currentTimer == null) return;
    if (state.currentPhaseIndex < state.currentTimer!.phases.length - 1) {
      state = state.copyWith(currentPhaseIndex: state.currentPhaseIndex + 1);
    }
  }
}
