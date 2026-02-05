import 'package:classroom_timer/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TimerControls extends StatelessWidget {
  final bool isRunning;
  final VoidCallback onTogglePause;
  final VoidCallback onReset;

  const TimerControls({
    super.key,
    required this.isRunning,
    required this.onTogglePause,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ControlButton(
          icon: isRunning ? Icons.pause : Icons.play_arrow,
          label: isRunning ? '一時停止' : '再生',
          onTap: onTogglePause,
        ),
        const SizedBox(width: 32),
        _ControlButton(
          icon: Icons.replay,
          label: 'リセット',
          onTap: onReset,
        ),
      ],
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ControlButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final color = isDark ? AppColors.textMutedDark : AppColors.textMutedLight;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isDark ? const Color(0xFF374151) : AppColors.borderLight,
              ),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
