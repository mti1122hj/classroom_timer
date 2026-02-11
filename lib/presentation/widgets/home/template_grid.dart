import 'package:classroom_timer/domain/entities/class_session_type.dart';
import 'package:classroom_timer/presentation/pages/timer_page.dart';
import 'package:classroom_timer/presentation/pages/template_edit/template_edit_page.dart';
import 'package:flutter/material.dart';

class TemplateGrid extends StatelessWidget {
  final List<ClassSessionType> sessionTypes;

  const TemplateGrid({super.key, required this.sessionTypes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'どの授業を始めますか？',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'テンプレートを選択して、すぐに計時を開始できます。',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF64748B),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.0,
          ),
          itemCount: sessionTypes.length + 1, // +1 for "Custom" card
          itemBuilder: (context, index) {
            if (index == sessionTypes.length) {
              return const _CustomTemplateCard();
            }
            return _TemplateCard(sessionType: sessionTypes[index]);
          },
        ),
      ],
    );
  }
}

class _TemplateCard extends StatelessWidget {
  final ClassSessionType sessionType;

  const _TemplateCard({required this.sessionType});

  @override
  Widget build(BuildContext context) {
    // Determine style based on ID (simplified logic)
    final isNormal = sessionType.id.startsWith('normal');
    final isTest = sessionType.id.startsWith('test');
    // Default to short/other style if not normal or test
    final isShort = !isNormal && !isTest;

    Color iconBgColor;
    Color iconColor;
    IconData iconData;

    if (isNormal) {
      iconBgColor = const Color(0xFFEFF6FF); // blue-50
      iconColor = const Color(0xFF5579FA); // primary
      iconData = Icons.school_outlined;
    } else if (isTest) {
      iconBgColor = const Color(0xFFFAF5FF); // purple-50
      iconColor = const Color(0xFF9333EA); // purple-600
      iconData = Icons.assignment_outlined;
    } else {
      iconBgColor = const Color(0xFFECFDF5); // emerald-50
      iconColor = const Color(0xFF059669); // emerald-600
      iconData = Icons.groups_outlined;
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1F5F9)), // slate-100
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () {
             Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TimerPage(sessionType: sessionType),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    iconData,
                    color: iconColor,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  sessionType.name.split(' ').first, // extract main name (e.g. "通常授業")
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.schedule,
                      size: 16,
                      color: Color(0xFF64748B), // slate-500
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${sessionType.totalDurationInMinutes}分',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomTemplateCard extends StatelessWidget {
  const _CustomTemplateCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC), // slate-50
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFF1F5F9), // slate-100
          style: BorderStyle.solid, // Should be dashed ideally, but solid for simpler implementation first
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const TemplateEditPage(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFF1F5F9)),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Color(0xFF94A3B8), // slate-400
                    size: 30,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'カスタム',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '新規作成',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
