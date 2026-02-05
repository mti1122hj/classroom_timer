import 'package:classroom_timer/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TimerHeader extends StatelessWidget {
  const TimerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: BoxDecoration(
        color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        border: Border(
          bottom: BorderSide(
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Icon
          const SizedBox(
            width: 40,
            height: 40,
            child: Center(
              child: Icon(
                Icons.timer_outlined,
                color: AppColors.primary,
                size: 30,
              ),
            ),
          ),
          // Title
          Expanded(
            child: Text(
              '授業タイマー',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isDark ? AppColors.textMainDark : AppColors.textMainLight,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Right Icon
          const SizedBox(
            width: 40,
            height: 40,
            child: Center(
              child: Icon(
                Icons.settings_outlined,
                color: AppColors.textMutedLight,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
