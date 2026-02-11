import 'package:classroom_timer/domain/entities/class_session_type.dart';
import 'package:classroom_timer/presentation/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'class_session_providers.g.dart';

@riverpod
Stream<List<ClassSessionType>> classSessionTypesStream(ClassSessionTypesStreamRef ref) {
  final repository = ref.watch(classSessionRepositoryProvider);
  return repository.watchClassSessionTypes();
}
