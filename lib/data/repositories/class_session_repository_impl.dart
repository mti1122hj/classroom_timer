
import 'package:isar/isar.dart';
import '../../domain/repositories/class_session_repository.dart';
import '../../domain/entities/class_session_type.dart';
import '../models/class_session_type_model.dart';
import '../models/class_session_type_model.dart'; // import for generated extension methods? No, usually model file has part.

class ClassSessionRepositoryImpl implements ClassSessionRepository {
  final Isar _isar;

  ClassSessionRepositoryImpl(this._isar);

  @override
  Future<List<ClassSessionType>> getClassSessionTypes() async {
    final models = await _isar.classSessionTypeModels.where().findAll();
    return models.map((m) => _toDomain(m)).toList();
  }

  @override
  Future<ClassSessionType?> getClassSessionTypeById(String id) async {
    final model = await _isar.classSessionTypeModels.getBySessionId(id);
    return model != null ? _toDomain(model) : null;
  }

  @override
  Future<void> saveClassSessionType(ClassSessionType sessionType) async {
    final model = _toModel(sessionType);
    await _isar.writeTxn(() async {
      final existing = await _isar.classSessionTypeModels.getBySessionId(sessionType.id);
      if (existing != null) {
        model.id = existing.id;
      }
      await _isar.classSessionTypeModels.put(model);
    });
  }

  @override
  Future<void> deleteClassSessionType(String id) async {
     await _isar.writeTxn(() async {
       await _isar.classSessionTypeModels.filter().sessionIdEqualTo(id).deleteAll();
     });
  }

  ClassSessionType _toDomain(ClassSessionTypeModel model) {
    return ClassSessionType(
      id: model.sessionId,
      name: model.name,
      totalDurationInMinutes: model.totalDurationInMinutes,
      sections: model.sections.map((s) => SessionSection(
        id: s.sectionId,
        label: s.label,
        durationInMinutes: s.durationInMinutes,
        isBreak: s.isBreak,
      )).toList(),
    );
  }

  ClassSessionTypeModel _toModel(ClassSessionType domain) {
    return ClassSessionTypeModel()
      ..sessionId = domain.id
      ..name = domain.name
      ..totalDurationInMinutes = domain.totalDurationInMinutes
      ..sections = domain.sections.map((s) => SessionSectionModel()
        ..sectionId = s.id
        ..label = s.label
        ..durationInMinutes = s.durationInMinutes
        ..isBreak = s.isBreak
      ).toList();
  }
}
