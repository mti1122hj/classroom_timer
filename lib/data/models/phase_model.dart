import 'package:isar/isar.dart';

part 'phase_model.g.dart';

@embedded
class PhaseModel {
  late String phaseId;
  late String title;
  late int durationMinutes;
  late int sortOrder;
}
