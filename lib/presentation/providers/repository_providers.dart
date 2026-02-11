import 'package:classroom_timer/core/providers/isar_provider.dart';
import 'package:classroom_timer/data/repositories/class_session_repository_impl.dart';
import 'package:classroom_timer/domain/repositories/class_session_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_providers.g.dart';

@riverpod
ClassSessionRepository classSessionRepository(ClassSessionRepositoryRef ref) {
  final isar = ref.watch(isarProvider);
  return ClassSessionRepositoryImpl(isar);
}
