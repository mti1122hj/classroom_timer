import '../entities/classroom_timer.dart';

abstract class TimerRepository {
  Future<void> saveTimer(ClassroomTimer timer);
  Future<List<ClassroomTimer>> getTimers();
  Future<ClassroomTimer?> getTimer(String id);
  Future<void> deleteTimer(String id);
}
