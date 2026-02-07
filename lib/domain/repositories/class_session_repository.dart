import 'package:classroom_timer/domain/entities/class_session_type.dart';

abstract class ClassSessionRepository {
  /// returns a list of available class session types (scenarios)
  Future<List<ClassSessionType>> getClassSessionTypes();
  
  /// returns a single class session type by ID
  Future<ClassSessionType?> getClassSessionTypeById(String id);
}
