import 'package:classroom_timer/domain/entities/class_session_type.dart';
import 'package:classroom_timer/presentation/providers/repository_providers.dart';
import 'package:classroom_timer/presentation/widgets/home/bottom_nav_bar.dart';
import 'package:classroom_timer/presentation/widgets/common/custom_app_bar.dart';
import 'package:classroom_timer/presentation/widgets/home/recent_history_section.dart';
import 'package:classroom_timer/presentation/widgets/home/template_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionTypesAsync = ref.watch(classSessionRepositoryProvider).getClassSessionTypes();

    return Scaffold(
      extendBodyBehindAppBar: true, 
      appBar: const CustomAppBar(
        title: '授業を開始',
        showBackButton: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              children: [
                // Template Grid Section
                FutureBuilder<List<ClassSessionType>>(
                  future: sessionTypesAsync,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('エラーが発生しました: ${snapshot.error}'));
                    }
                    final sessionTypes = snapshot.data ?? [];
                    return TemplateGrid(sessionTypes: sessionTypes);
                  },
                ),
                
                const SizedBox(height: 32),
                
                // History Section
                const RecentHistorySection(),
                
                // Bottom padding
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
