import 'package:classroom_timer/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OverallProgressCard extends StatelessWidget {
  final Duration elapsed;
  final Duration total;
  final String nextPhaseTitle;
  final Duration nextPhaseRemaining;

  const OverallProgressCard({
    super.key,
    required this.elapsed,
    required this.total,
    required this.nextPhaseTitle,
    required this.nextPhaseRemaining,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    // Calculate progress
    final progress = total.inSeconds > 0 
        ? (elapsed.inSeconds / total.inSeconds).clamp(0.0, 1.0) 
        : 0.0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF111827) : Colors.white, // gray-900 : white
        borderRadius: BorderRadius.circular(12), // rounded-xl
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top Row: Label & Value vs Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '全体の進捗',
                    style: TextStyle(
                      color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5, // uppercase tracking-wider
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${elapsed.inMinutes} / ${total.inMinutes} min',
                    style: TextStyle(
                      color: isDark ? AppColors.textMainDark : AppColors.textMainLight,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Status
              Container(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 14, // text-sm
                      color: AppColors.success,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'オンスケジュール',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.success,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: isDark ? const Color(0xFF374151) : const Color(0xFFCFD7E7), // gray-700
              color: AppColors.primary,
              minHeight: 12, // h-3
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Next Phase Info
          Text(
            '次は: $nextPhaseTitle (残り${nextPhaseRemaining.inMinutes}分)',
            style: TextStyle(
              color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
