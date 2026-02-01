import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/classroom_timer.dart';
import '../../domain/entities/phase.dart';
import '../providers/timer_controller.dart';
import '../widgets/traffic_light_indicator.dart';

class TimerPage extends ConsumerStatefulWidget {
  const TimerPage({super.key});

  @override
  ConsumerState<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends ConsumerState<TimerPage> {
  @override
  void initState() {
    super.initState();
    // テスト用にダミーデータをロード
    // 実際は一覧画面から渡されたりRepositoryから取得する
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final dummyTimer = ClassroomTimer(
        id: '1',
        title: 'Demo Class',
        totalDurationMinutes: 60,
        phases: [
          const Phase(id: 'p1', title: '導入', durationMinutes: 10),
          const Phase(id: 'p2', title: '展開', durationMinutes: 40),
          const Phase(id: 'p3', title: 'まとめ', durationMinutes: 10),
        ],
      );
      ref.read(timerControllerProvider.notifier).loadTimer(dummyTimer);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(timerControllerProvider);
    final controller = ref.read(timerControllerProvider.notifier);

    // タイマー未ロード時はローディング
    if (state.currentTimer == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    
    final remaining = state.remainingTime;

    return Scaffold(
      appBar: AppBar(
        title: Text(state.currentTimer!.title),
      ),
      body: Column(
        children: [
          // 信号機UI
          TrafficLightIndicator(remaining: remaining),
          
          const SizedBox(height: 20),
          
          // 情報表示
          Text('経過時間: ${_formatDuration(state.elapsedTime)}'),
          Text('現在のフェーズ: ${state.currentTimer!.phases[state.currentPhaseIndex].title}'),
          Text('フェーズNo: ${state.currentPhaseIndex + 1} / ${state.currentTimer!.phases.length}'),
          
          const SizedBox(height: 40),
          
          // 操作ボタン
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: state.isRunning ? controller.pause : controller.start,
                child: Text(state.isRunning ? 'PAUSE' : 'START'),
              ),
              ElevatedButton(
                onPressed: controller.reset,
                child: const Text('RESET'),
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // フェーズ操作
          ElevatedButton(
            onPressed: controller.nextPhase,
            child: const Text('次のフェーズへ'),
          ),
          
          const Spacer(),
          
          // 巻きボタン（大きく）
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: double.infinity,
              height: 80,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.speed),
                label: const Text('巻き実行 (Maki)'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                onPressed: controller.executeMaki,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  String _formatDuration(Duration d) {
    final m = d.inMinutes;
    final s = d.inSeconds % 60;
    return '${m}m ${s}s';
  }
}
