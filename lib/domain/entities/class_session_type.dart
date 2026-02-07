import 'package:freezed_annotation/freezed_annotation.dart';

part 'class_session_type.freezed.dart';
part 'class_session_type.g.dart';

@freezed
class ClassSessionType with _$ClassSessionType {
  const factory ClassSessionType({
    required String id,
    required String name,
    required int totalDurationInMinutes,
    required List<SessionSection> sections,
  }) = _ClassSessionType;

  factory ClassSessionType.fromJson(Map<String, dynamic> json) =>
      _$ClassSessionTypeFromJson(json);
}

@freezed
class SessionSection with _$SessionSection {
  const factory SessionSection({
    required String id,
    required String label,
    required int durationInMinutes,
    // Determines if this section counts towards the "main" activity or is overhead (optional for now)
    @Default(false) bool isBreak,
  }) = _SessionSection;

  factory SessionSection.fromJson(Map<String, dynamic> json) =>
      _$SessionSectionFromJson(json);
}
