import 'package:freezed_annotation/freezed_annotation.dart';

part 'phase.freezed.dart';

@freezed
class Phase with _$Phase {
  const factory Phase({
    required String id,
    required String title,
    required int durationMinutes,
    @Default(0) int sortOrder,
  }) = _Phase;
}
