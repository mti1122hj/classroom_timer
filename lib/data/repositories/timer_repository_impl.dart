import 'package:isar/isar.dart';
import '../../domain/entities/classroom_timer.dart';
import '../../domain/entities/phase.dart';
import '../../domain/repositories/timer_repository.dart';
import '../models/classroom_timer_model.dart';
import '../models/phase_model.dart';

class TimerRepositoryImpl implements TimerRepository {
  final Isar isar;

  TimerRepositoryImpl(this.isar);

  @override
  Future<void> saveTimer(ClassroomTimer timer) async {
    final timerModel = ClassroomTimerModel()
      ..timerId = timer.id
      ..title = timer.title
      ..totalDurationMinutes = timer.totalDurationMinutes
      ..phases = timer.phases.map((p) => PhaseModel()
        ..phaseId = p.id
        ..title = p.title
        ..durationMinutes = p.durationMinutes
        ..sortOrder = p.sortOrder
      ).toList();

    await isar.writeTxn(() async {
      await isar.classroomTimerModels.putByTimerId(timerModel);
    });
  }

  @override
  Future<List<ClassroomTimer>> getTimers() async {
    final models = await isar.classroomTimerModels.where().findAll();
    return models.map((model) => _toEntity(model)).toList();
  }

  @override
  Future<ClassroomTimer?> getTimer(String id) async {
    final model = await isar.classroomTimerModels.filter().timerIdEqualTo(id).findFirst();
    return model == null ? null : _toEntity(model);
  }

  @override
  Future<void> deleteTimer(String id) async {
    await isar.writeTxn(() async {
      await isar.classroomTimerModels.filter().timerIdEqualTo(id).deleteAll();
    });
  }

  ClassroomTimer _toEntity(ClassroomTimerModel model) {
    return ClassroomTimer(
      id: model.timerId,
      title: model.title,
      totalDurationMinutes: model.totalDurationMinutes,
      phases: model.phases.map((p) => Phase(
        id: p.phaseId,
        title: p.title,
        durationMinutes: p.durationMinutes,
        sortOrder: p.sortOrder,
      )).toList(),
    );
  }
}
