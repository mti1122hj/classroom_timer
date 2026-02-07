import 'package:flutter/material.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9), // ios-blur base
        border: Border(
          top: BorderSide(
            color: const Color(0xFFE2E8F0).withOpacity(0.5), // slate-200/50
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home_filled, // Approx for home_storage
            label: 'ホーム',
            isSelected: true,
          ),
          _NavItem(
            icon: Icons.calendar_month_outlined,
            label: '予定',
            isSelected: false,
          ),
          _NavItem(
            icon: Icons.analytics_outlined,
            label: '分析',
            isSelected: false,
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected 
        ? Theme.of(context).primaryColor 
        : const Color(0xFF94A3B8); // slate-400

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: color,
          ),
        ),
        // Padding to approximate pb-5 visual from HTML (84px height)
        const SizedBox(height: 12),
      ],
    );
  }
}
