import 'package:classroom_timer/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class NextSectionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextSectionButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              shadowColor: AppColors.primary.withOpacity(0.3),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '次のセクションへ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 12),
                Icon(Icons.arrow_forward_ios, size: 30),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '※ 次に進むと、残りの時間が以降のセクションに自動配分されます',
          style: TextStyle(
            color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
