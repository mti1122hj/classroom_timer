// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_edit_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TemplateEditState {
  String? get id =>
      throw _privateConstructorUsedError; // Template ID (null for new template)
  List<Phase> get phases => throw _privateConstructorUsedError;
  int get totalDurationMinutes => throw _privateConstructorUsedError;
  bool get autoAdjustEnabled => throw _privateConstructorUsedError;
  String get templateName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TemplateEditStateCopyWith<TemplateEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateEditStateCopyWith<$Res> {
  factory $TemplateEditStateCopyWith(
          TemplateEditState value, $Res Function(TemplateEditState) then) =
      _$TemplateEditStateCopyWithImpl<$Res, TemplateEditState>;
  @useResult
  $Res call(
      {String? id,
      List<Phase> phases,
      int totalDurationMinutes,
      bool autoAdjustEnabled,
      String templateName});
}

/// @nodoc
class _$TemplateEditStateCopyWithImpl<$Res, $Val extends TemplateEditState>
    implements $TemplateEditStateCopyWith<$Res> {
  _$TemplateEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? phases = null,
    Object? totalDurationMinutes = null,
    Object? autoAdjustEnabled = null,
    Object? templateName = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      phases: null == phases
          ? _value.phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<Phase>,
      totalDurationMinutes: null == totalDurationMinutes
          ? _value.totalDurationMinutes
          : totalDurationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      autoAdjustEnabled: null == autoAdjustEnabled
          ? _value.autoAdjustEnabled
          : autoAdjustEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      templateName: null == templateName
          ? _value.templateName
          : templateName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemplateEditStateImplCopyWith<$Res>
    implements $TemplateEditStateCopyWith<$Res> {
  factory _$$TemplateEditStateImplCopyWith(_$TemplateEditStateImpl value,
          $Res Function(_$TemplateEditStateImpl) then) =
      __$$TemplateEditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      List<Phase> phases,
      int totalDurationMinutes,
      bool autoAdjustEnabled,
      String templateName});
}

/// @nodoc
class __$$TemplateEditStateImplCopyWithImpl<$Res>
    extends _$TemplateEditStateCopyWithImpl<$Res, _$TemplateEditStateImpl>
    implements _$$TemplateEditStateImplCopyWith<$Res> {
  __$$TemplateEditStateImplCopyWithImpl(_$TemplateEditStateImpl _value,
      $Res Function(_$TemplateEditStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? phases = null,
    Object? totalDurationMinutes = null,
    Object? autoAdjustEnabled = null,
    Object? templateName = null,
  }) {
    return _then(_$TemplateEditStateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      phases: null == phases
          ? _value._phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<Phase>,
      totalDurationMinutes: null == totalDurationMinutes
          ? _value.totalDurationMinutes
          : totalDurationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      autoAdjustEnabled: null == autoAdjustEnabled
          ? _value.autoAdjustEnabled
          : autoAdjustEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      templateName: null == templateName
          ? _value.templateName
          : templateName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TemplateEditStateImpl extends _TemplateEditState {
  const _$TemplateEditStateImpl(
      {this.id,
      final List<Phase> phases = const [],
      this.totalDurationMinutes = 50,
      this.autoAdjustEnabled = true,
      this.templateName = ''})
      : _phases = phases,
        super._();

  @override
  final String? id;
// Template ID (null for new template)
  final List<Phase> _phases;
// Template ID (null for new template)
  @override
  @JsonKey()
  List<Phase> get phases {
    if (_phases is EqualUnmodifiableListView) return _phases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_phases);
  }

  @override
  @JsonKey()
  final int totalDurationMinutes;
  @override
  @JsonKey()
  final bool autoAdjustEnabled;
  @override
  @JsonKey()
  final String templateName;

  @override
  String toString() {
    return 'TemplateEditState(id: $id, phases: $phases, totalDurationMinutes: $totalDurationMinutes, autoAdjustEnabled: $autoAdjustEnabled, templateName: $templateName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateEditStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._phases, _phases) &&
            (identical(other.totalDurationMinutes, totalDurationMinutes) ||
                other.totalDurationMinutes == totalDurationMinutes) &&
            (identical(other.autoAdjustEnabled, autoAdjustEnabled) ||
                other.autoAdjustEnabled == autoAdjustEnabled) &&
            (identical(other.templateName, templateName) ||
                other.templateName == templateName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_phases),
      totalDurationMinutes,
      autoAdjustEnabled,
      templateName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateEditStateImplCopyWith<_$TemplateEditStateImpl> get copyWith =>
      __$$TemplateEditStateImplCopyWithImpl<_$TemplateEditStateImpl>(
          this, _$identity);
}

abstract class _TemplateEditState extends TemplateEditState {
  const factory _TemplateEditState(
      {final String? id,
      final List<Phase> phases,
      final int totalDurationMinutes,
      final bool autoAdjustEnabled,
      final String templateName}) = _$TemplateEditStateImpl;
  const _TemplateEditState._() : super._();

  @override
  String? get id;
  @override // Template ID (null for new template)
  List<Phase> get phases;
  @override
  int get totalDurationMinutes;
  @override
  bool get autoAdjustEnabled;
  @override
  String get templateName;
  @override
  @JsonKey(ignore: true)
  _$$TemplateEditStateImplCopyWith<_$TemplateEditStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
