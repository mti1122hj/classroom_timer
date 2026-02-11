import 'package:classroom_timer/presentation/widgets/timer/circular_timer_display.dart';
import 'package:classroom_timer/presentation/widgets/timer/next_section_button.dart';
import 'package:classroom_timer/presentation/widgets/timer/overall_progress_card.dart';
import 'package:classroom_timer/presentation/widgets/timer/timer_controls.dart';
import 'package:classroom_timer/presentation/widgets/common/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/classroom_timer.dart';
import '../../domain/entities/phase.dart';
import '../providers/timer_controller.dart';
// import '../widgets/traffic_light_indicator.dart'; // No longer used

import '../../domain/entities/class_session_type.dart';

class TimerPage extends ConsumerStatefulWidget {
  final ClassSessionType sessionType;

  const TimerPage({super.key, required this.sessionType});

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
      final timer = ClassroomTimer(
        id: DateTime.now().toIso8601String(), // Generate a unique ID for this instance
        title: widget.sessionType.name,
        totalDurationMinutes: widget.sessionType.totalDurationInMinutes,
        phases: widget.sessionType.sections.map((s) => Phase(
          id: s.id,
          title: s.label,
          durationMinutes: s.durationInMinutes,
        )).toList(),
      );
      ref.read(timerControllerProvider.notifier).loadTimer(timer);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(timerControllerProvider);
    final controller = ref.read(timerControllerProvider.notifier);
    
    // Theme setup based on HTML config if needed, but handled by widgets
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (state.currentTimer == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final currentPhase = state.currentTimer!.phases[state.currentPhaseIndex];
    // Calculate total duration of this phase? Or total duration of everything?
    // "全体の進捗" uses total duration of the class.
    // "円形タイマー" uses remaining time of current phase? 
    // HTML: "現在のセクション" "グループワーク・演習" "12:45"
    // Usually section timer.
    
    // Logic for Overall Progress
    // We need total elapsed time vs total time.
    final totalDuration = Duration(minutes: state.currentTimer!.totalDurationMinutes);
    final totalElapsed = state.elapsedTime; // Assuming this tracks total elapsed
    
    // Check if started (based on elapsed time being zero)
    // Note: If user pauses immediately at 0, it might show start. 
    // Assuming start immediately ticks or we rely on isRunning for something else.
    // Ideally we track 'hasStarted' in state, but elapsed == 0 is good enough for "Reset" state.
    // Fix: check isRunning too, so it switches immediately on start tap.
    final bool hasStarted = totalElapsed > Duration.zero || state.isRunning;

    // Logic for Current Phase
    // HTML "次は: まとめ (残り15分)"
    // User Feedback: "全体の進捗の「次は：」に、最初のセクション（サンプルだと、「導入」）が表示される形にして" (when before start)
    
    String nextPhaseTitle;
    Duration nextPhaseDuration;
    
    if (!hasStarted) {
        // Before start: Show current (first/active) section as "Next" (or "Starting")
        nextPhaseTitle = currentPhase.title;
        nextPhaseDuration = Duration(minutes: currentPhase.durationMinutes);
    } else {
        // Standard logic
        final hasNext = state.currentPhaseIndex < state.currentTimer!.phases.length - 1;
        nextPhaseTitle = hasNext ? state.currentTimer!.phases[state.currentPhaseIndex + 1].title : '終了';
        nextPhaseDuration = hasNext ? Duration(minutes: state.currentTimer!.phases[state.currentPhaseIndex + 1].durationMinutes) : Duration.zero;
    }

    // Logic for Circular Timer (Current Phase)
    // state.remainingTime is usually for the current phase.
    final phaseTotalDuration = Duration(minutes: currentPhase.durationMinutes);
    // If remainingTime is 12:45, and total is 20:00.
    
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0F1423) : const Color(0xFFF5F6F8),
      appBar: const CustomAppBar(
        title: '授業タイマー',
        showBackButton: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(maxWidth: 512),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 24),
                                OverallProgressCard(
                                  elapsed: totalElapsed,
                                  total: totalDuration,
                                  nextPhaseTitle: nextPhaseTitle,
                                  nextPhaseRemaining: nextPhaseDuration,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 24),
                                CircularTimerDisplay(
                                  phaseTitle: currentPhase.title,
                                  remaining: state.currentSectionRemainingTime,
                                  total: phaseTotalDuration,
                                  isAutoDistributionEnabled: true,
                                  hasStarted: hasStarted,
                                  onStart: controller.start,
                                ),
                                const SizedBox(height: 32),
                                TimerControls(
                                  isRunning: state.isRunning,
                                  onTogglePause: state.isRunning
                                      ? controller.pause
                                      : controller.start,
                                  onReset: controller.reset,
                                ),
                                const SizedBox(height: 24),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: NextSectionButton(
                                onPressed: controller.nextPhase,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
