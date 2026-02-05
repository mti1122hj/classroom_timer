import 'package:classroom_timer/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CircularTimerDisplay extends StatefulWidget {
  final String phaseTitle;
  final Duration remaining;
  final Duration total;
  final bool isAutoDistributionEnabled;
  final bool hasStarted;
  final VoidCallback? onStart;

  const CircularTimerDisplay({
    super.key,
    required this.phaseTitle,
    required this.remaining,
    required this.total,
    this.isAutoDistributionEnabled = false,
    this.hasStarted = true,
    this.onStart,
  });

  @override
  State<CircularTimerDisplay> createState() => _CircularTimerDisplayState();
}

class _CircularTimerDisplayState extends State<CircularTimerDisplay> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.5, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleStart() {
    if (widget.onStart != null) {
      _controller.forward(from: 0.0);
      widget.onStart!();
    }
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    final progress = widget.total.inSeconds > 0
        ? widget.remaining.inSeconds / widget.total.inSeconds
        : 0.0;

    // Color adjustment: GREEN if not started, otherwise Primary.
    final circleColor = widget.hasStarted ? AppColors.primary : AppColors.success;
    
    // Tap handler only if not started (or maybe always if we want toggle? request said "click to play")
    // "再生する前は...それをクリックすると再生されるようにして"
    // -> Tap to start.
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Badge
        if (widget.isAutoDistributionEnabled)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryLight20,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: AppColors.primary.withOpacity(0.2)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.auto_fix_high, size: 18, color: AppColors.primary),
                SizedBox(width: 8),
                Text(
                  '自動再配分 ON',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        
        const SizedBox(height: 16),
        
        // Label
        Text(
          '現在のセクション',
          style: TextStyle(
            color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
            fontSize: 20, // text-xl
            fontWeight: FontWeight.w500,
            letterSpacing: 1.0, // tracking-wide
          ),
        ),
        
        const SizedBox(height: 8),
        
        // Phase Title
        Text(
          widget.phaseTitle,
          style: TextStyle(
            color: isDark ? AppColors.textMainDark : AppColors.textMainLight,
            fontSize: 30, // text-3xl
            fontWeight: FontWeight.w800, // font-extrabold
            letterSpacing: -0.5, // tracking-tight
          ),
        ),
        
        const SizedBox(height: 32),
        
        // Circular Timer
        SizedBox(
          width: 280,
          height: 280,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              // Expanding Ring Effect (Only when animating)
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  if (!_controller.isAnimating) return const SizedBox.shrink();
                  return Opacity(
                    opacity: _opacityAnimation.value,
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.success,
                            width: 12, // Same width as progress
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              // Background & Value Circle
              GestureDetector(
                onTap: !widget.hasStarted ? _handleStart : null,
                behavior: HitTestBehavior.opaque,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                     CircularProgressIndicator(
                      value: widget.hasStarted ? progress.clamp(0.0, 1.0) : 1.0, 
                      backgroundColor: widget.hasStarted 
                          ? (isDark ? const Color(0xFF1F2937) : const Color(0xFFCFD7E7))
                          : circleColor.withOpacity(0.2), 
                      color: circleColor,
                      strokeWidth: 12, 
                      strokeCap: StrokeCap.round, 
                    ),
                    
                    // Timer Text / Start Text
                    Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          widget.hasStarted ? _formatDuration(widget.remaining) : 'スタート',
                          style: TextStyle(
                            color: widget.hasStarted 
                                 ? (isDark ? AppColors.textMainDark : AppColors.textMainLight)
                                 : circleColor, 
                            fontSize: widget.hasStarted ? 84 : 64, 
                            fontWeight: FontWeight.bold,
                            height: 1.0, 
                          ),
                        ),
                      ),
                    ),
                    
                    // Play Icon overlay 
                    if (!widget.hasStarted)
                       Positioned(
                         bottom: 40,
                         left: 0,
                         right: 0,
                         child: Icon(Icons.touch_app, color: circleColor.withOpacity(0.5), size: 32),
                       ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
