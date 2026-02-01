import 'package:freezed_annotation/freezed_annotation.dart';
import 'phase.dart';

part 'classroom_timer.freezed.dart';

@freezed
class ClassroomTimer with _$ClassroomTimer {
  const factory ClassroomTimer({
    required String id,
    required String title,
    required int totalDurationMinutes,
    required List<Phase> phases,
  }) = _ClassroomTimer;
}
