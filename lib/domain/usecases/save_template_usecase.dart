import 'package:classroom_timer/domain/entities/class_session_type.dart';
import 'package:classroom_timer/domain/repositories/class_session_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/providers/repository_providers.dart';

part 'save_template_usecase.g.dart';

class SaveTemplateUseCase {
  final ClassSessionRepository _repository;

  SaveTemplateUseCase(this._repository);

  Future<void> execute(ClassSessionType template) async {
    await _repository.saveClassSessionType(template);
  }
}

@riverpod
SaveTemplateUseCase saveTemplateUseCase(SaveTemplateUseCaseRef ref) {
  final repository = ref.watch(classSessionRepositoryProvider);
  return SaveTemplateUseCase(repository);
}
