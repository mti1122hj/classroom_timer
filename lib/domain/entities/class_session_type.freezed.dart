// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'class_session_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClassSessionType _$ClassSessionTypeFromJson(Map<String, dynamic> json) {
  return _ClassSessionType.fromJson(json);
}

/// @nodoc
mixin _$ClassSessionType {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get totalDurationInMinutes => throw _privateConstructorUsedError;
  List<SessionSection> get sections => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClassSessionTypeCopyWith<ClassSessionType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassSessionTypeCopyWith<$Res> {
  factory $ClassSessionTypeCopyWith(
          ClassSessionType value, $Res Function(ClassSessionType) then) =
      _$ClassSessionTypeCopyWithImpl<$Res, ClassSessionType>;
  @useResult
  $Res call(
      {String id,
      String name,
      int totalDurationInMinutes,
      List<SessionSection> sections});
}

/// @nodoc
class _$ClassSessionTypeCopyWithImpl<$Res, $Val extends ClassSessionType>
    implements $ClassSessionTypeCopyWith<$Res> {
  _$ClassSessionTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? totalDurationInMinutes = null,
    Object? sections = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalDurationInMinutes: null == totalDurationInMinutes
          ? _value.totalDurationInMinutes
          : totalDurationInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      sections: null == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<SessionSection>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassSessionTypeImplCopyWith<$Res>
    implements $ClassSessionTypeCopyWith<$Res> {
  factory _$$ClassSessionTypeImplCopyWith(_$ClassSessionTypeImpl value,
          $Res Function(_$ClassSessionTypeImpl) then) =
      __$$ClassSessionTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int totalDurationInMinutes,
      List<SessionSection> sections});
}

/// @nodoc
class __$$ClassSessionTypeImplCopyWithImpl<$Res>
    extends _$ClassSessionTypeCopyWithImpl<$Res, _$ClassSessionTypeImpl>
    implements _$$ClassSessionTypeImplCopyWith<$Res> {
  __$$ClassSessionTypeImplCopyWithImpl(_$ClassSessionTypeImpl _value,
      $Res Function(_$ClassSessionTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? totalDurationInMinutes = null,
    Object? sections = null,
  }) {
    return _then(_$ClassSessionTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalDurationInMinutes: null == totalDurationInMinutes
          ? _value.totalDurationInMinutes
          : totalDurationInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      sections: null == sections
          ? _value._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<SessionSection>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassSessionTypeImpl implements _ClassSessionType {
  const _$ClassSessionTypeImpl(
      {required this.id,
      required this.name,
      required this.totalDurationInMinutes,
      required final List<SessionSection> sections})
      : _sections = sections;

  factory _$ClassSessionTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassSessionTypeImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int totalDurationInMinutes;
  final List<SessionSection> _sections;
  @override
  List<SessionSection> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  String toString() {
    return 'ClassSessionType(id: $id, name: $name, totalDurationInMinutes: $totalDurationInMinutes, sections: $sections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassSessionTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.totalDurationInMinutes, totalDurationInMinutes) ||
                other.totalDurationInMinutes == totalDurationInMinutes) &&
            const DeepCollectionEquality().equals(other._sections, _sections));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, totalDurationInMinutes,
      const DeepCollectionEquality().hash(_sections));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassSessionTypeImplCopyWith<_$ClassSessionTypeImpl> get copyWith =>
      __$$ClassSessionTypeImplCopyWithImpl<_$ClassSessionTypeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassSessionTypeImplToJson(
      this,
    );
  }
}

abstract class _ClassSessionType implements ClassSessionType {
  const factory _ClassSessionType(
      {required final String id,
      required final String name,
      required final int totalDurationInMinutes,
      required final List<SessionSection> sections}) = _$ClassSessionTypeImpl;

  factory _ClassSessionType.fromJson(Map<String, dynamic> json) =
      _$ClassSessionTypeImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get totalDurationInMinutes;
  @override
  List<SessionSection> get sections;
  @override
  @JsonKey(ignore: true)
  _$$ClassSessionTypeImplCopyWith<_$ClassSessionTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SessionSection _$SessionSectionFromJson(Map<String, dynamic> json) {
  return _SessionSection.fromJson(json);
}

/// @nodoc
mixin _$SessionSection {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  int get durationInMinutes =>
      throw _privateConstructorUsedError; // Determines if this section counts towards the "main" activity or is overhead (optional for now)
  bool get isBreak => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionSectionCopyWith<SessionSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionSectionCopyWith<$Res> {
  factory $SessionSectionCopyWith(
          SessionSection value, $Res Function(SessionSection) then) =
      _$SessionSectionCopyWithImpl<$Res, SessionSection>;
  @useResult
  $Res call({String id, String label, int durationInMinutes, bool isBreak});
}

/// @nodoc
class _$SessionSectionCopyWithImpl<$Res, $Val extends SessionSection>
    implements $SessionSectionCopyWith<$Res> {
  _$SessionSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? durationInMinutes = null,
    Object? isBreak = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      durationInMinutes: null == durationInMinutes
          ? _value.durationInMinutes
          : durationInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      isBreak: null == isBreak
          ? _value.isBreak
          : isBreak // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionSectionImplCopyWith<$Res>
    implements $SessionSectionCopyWith<$Res> {
  factory _$$SessionSectionImplCopyWith(_$SessionSectionImpl value,
          $Res Function(_$SessionSectionImpl) then) =
      __$$SessionSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String label, int durationInMinutes, bool isBreak});
}

/// @nodoc
class __$$SessionSectionImplCopyWithImpl<$Res>
    extends _$SessionSectionCopyWithImpl<$Res, _$SessionSectionImpl>
    implements _$$SessionSectionImplCopyWith<$Res> {
  __$$SessionSectionImplCopyWithImpl(
      _$SessionSectionImpl _value, $Res Function(_$SessionSectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? durationInMinutes = null,
    Object? isBreak = null,
  }) {
    return _then(_$SessionSectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      durationInMinutes: null == durationInMinutes
          ? _value.durationInMinutes
          : durationInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      isBreak: null == isBreak
          ? _value.isBreak
          : isBreak // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionSectionImpl implements _SessionSection {
  const _$SessionSectionImpl(
      {required this.id,
      required this.label,
      required this.durationInMinutes,
      this.isBreak = false});

  factory _$SessionSectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionSectionImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final int durationInMinutes;
// Determines if this section counts towards the "main" activity or is overhead (optional for now)
  @override
  @JsonKey()
  final bool isBreak;

  @override
  String toString() {
    return 'SessionSection(id: $id, label: $label, durationInMinutes: $durationInMinutes, isBreak: $isBreak)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionSectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.durationInMinutes, durationInMinutes) ||
                other.durationInMinutes == durationInMinutes) &&
            (identical(other.isBreak, isBreak) || other.isBreak == isBreak));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, label, durationInMinutes, isBreak);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionSectionImplCopyWith<_$SessionSectionImpl> get copyWith =>
      __$$SessionSectionImplCopyWithImpl<_$SessionSectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionSectionImplToJson(
      this,
    );
  }
}

abstract class _SessionSection implements SessionSection {
  const factory _SessionSection(
      {required final String id,
      required final String label,
      required final int durationInMinutes,
      final bool isBreak}) = _$SessionSectionImpl;

  factory _SessionSection.fromJson(Map<String, dynamic> json) =
      _$SessionSectionImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  int get durationInMinutes;
  @override // Determines if this section counts towards the "main" activity or is overhead (optional for now)
  bool get isBreak;
  @override
  @JsonKey(ignore: true)
  _$$SessionSectionImplCopyWith<_$SessionSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
