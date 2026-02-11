import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../../domain/entities/phase.dart';

import '../../../../domain/entities/class_session_type.dart';
import '../../../../domain/usecases/save_template_usecase.dart';

part 'template_edit_view_model.freezed.dart';

@freezed
class TemplateEditState with _$TemplateEditState {
  const factory TemplateEditState({
    String? id, // Template ID (null for new template)
    @Default([]) List<Phase> phases,
    @Default(50) int totalDurationMinutes,
    @Default(true) bool autoAdjustEnabled,
    @Default('') String templateName,
  }) = _TemplateEditState;

  const TemplateEditState._();

  int get currentTotalDuration => phases.fold(0, (sum, phase) => sum + phase.durationMinutes);
}

class TemplateEditViewModel extends StateNotifier<TemplateEditState> {
  final SaveTemplateUseCase _saveTemplateUseCase;

  TemplateEditViewModel(this._saveTemplateUseCase)
      : super(const TemplateEditState(phases: [
          Phase(id: '1', title: '導入', durationMinutes: 5),
          Phase(id: '2', title: '個人ワーク', durationMinutes: 25),
          Phase(id: '3', title: 'グループ共有・発表', durationMinutes: 15),
          Phase(id: '4', title: 'まとめ', durationMinutes: 5),
        ]));

  Future<void> saveTemplate() async {
    final templateId = state.id ?? const Uuid().v4();
    
    final sections = state.phases.map((p) => SessionSection(
      id: p.id,
      label: p.title,
      durationInMinutes: p.durationMinutes,
      isBreak: false, // Default false for now
    )).toList();

    final template = ClassSessionType(
      id: templateId,
      name: state.templateName,
      totalDurationInMinutes: state.currentTotalDuration,
      sections: sections,
    );

    await _saveTemplateUseCase.execute(template);

    if (state.id == null) {
      state = state.copyWith(id: templateId);
    }
  }

  void addPhase() {
    state = state.copyWith(
      phases: [
        ...state.phases,
        Phase(
          id: const Uuid().v4(),
          title: '',
          durationMinutes: 5,
        ),
      ],
    );
  }

  void removePhase(String id) {
    state = state.copyWith(
      phases: state.phases.where((p) => p.id != id).toList(),
    );
  }

  void reorderPhases(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final phases = [...state.phases];
    final item = phases.removeAt(oldIndex);
    phases.insert(newIndex, item);
    state = state.copyWith(phases: phases);
  }

  void updatePhaseDuration(String id, int newDuration) {
    if (newDuration < 0) return;
    state = state.copyWith(
      phases: state.phases.map((p) {
        if (p.id == id) {
          return p.copyWith(durationMinutes: newDuration);
        }
        return p;
      }).toList(),
    );
  }

  void updatePhaseTitle(String id, String newTitle) {
    state = state.copyWith(
      phases: state.phases.map((p) {
        if (p.id == id) {
          return p.copyWith(title: newTitle);
        }
        return p;
      }).toList(),
    );
  }

  void updateTemplateName(String newName) {
    state = state.copyWith(templateName: newName);
  }

  void toggleAutoAdjust() {
    state = state.copyWith(autoAdjustEnabled: !state.autoAdjustEnabled);
  }
}

final templateEditViewModelProvider =
    StateNotifierProvider<TemplateEditViewModel, TemplateEditState>((ref) {
  final saveUseCase = ref.watch(saveTemplateUseCaseProvider);
  return TemplateEditViewModel(saveUseCase);
});
