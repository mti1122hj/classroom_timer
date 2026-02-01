import 'package:flutter/material.dart';

class TrafficLightIndicator extends StatelessWidget {
  final Duration remaining;

  const TrafficLightIndicator({
    super.key,
    required this.remaining,
  });

  Color _getColor() {
    if (remaining.inSeconds < 0) {
      return Colors.red;
    } else if (remaining.inSeconds <= 60) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200, // 視認性のため大きく
      decoration: BoxDecoration(
        color: _getColor(),
      ),
      child: Center(
        child: Text(
          _formatDuration(remaining),
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white, // 背景色によっては見づらいかもしれないが一旦白
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration d) {
    final isNegative = d.isNegative;
    final absD = d.abs();
    final minutes = absD.inMinutes;
    final seconds = absD.inSeconds % 60;
    final sign = isNegative ? '-' : '';
    return '$sign${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
