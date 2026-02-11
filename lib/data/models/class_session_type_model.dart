import 'package:isar/isar.dart';

part 'class_session_type_model.g.dart';

@collection
class ClassSessionTypeModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String sessionId;

  late String name;
  late int totalDurationInMinutes;
  
  List<SessionSectionModel> sections = [];
}

@embedded
class SessionSectionModel {
  late String sectionId;
  late String label;
  late int durationInMinutes;
  late bool isBreak;
}
