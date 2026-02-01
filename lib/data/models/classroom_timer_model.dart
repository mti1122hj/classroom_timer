import 'package:isar/isar.dart';
import 'phase_model.dart';

part 'classroom_timer_model.g.dart';

@collection
class ClassroomTimerModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String timerId;

  late String title;
  late int totalDurationMinutes;
  
  List<PhaseModel> phases = [];
}
