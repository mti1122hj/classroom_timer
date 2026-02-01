// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimerState {
  ClassroomTimer? get currentTimer => throw _privateConstructorUsedError;
  Duration get elapsedTime => throw _privateConstructorUsedError;
  bool get isRunning => throw _privateConstructorUsedError;
  int get currentPhaseIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerStateCopyWith<TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res, TimerState>;
  @useResult
  $Res call(
      {ClassroomTimer? currentTimer,
      Duration elapsedTime,
      bool isRunning,
      int currentPhaseIndex});

  $ClassroomTimerCopyWith<$Res>? get currentTimer;
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res, $Val extends TimerState>
    implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTimer = freezed,
    Object? elapsedTime = null,
    Object? isRunning = null,
    Object? currentPhaseIndex = null,
  }) {
    return _then(_value.copyWith(
      currentTimer: freezed == currentTimer
          ? _value.currentTimer
          : currentTimer // ignore: cast_nullable_to_non_nullable
              as ClassroomTimer?,
      elapsedTime: null == elapsedTime
          ? _value.elapsedTime
          : elapsedTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      isRunning: null == isRunning
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPhaseIndex: null == currentPhaseIndex
          ? _value.currentPhaseIndex
          : currentPhaseIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClassroomTimerCopyWith<$Res>? get currentTimer {
    if (_value.currentTimer == null) {
      return null;
    }

    return $ClassroomTimerCopyWith<$Res>(_value.currentTimer!, (value) {
      return _then(_value.copyWith(currentTimer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TimerStateImplCopyWith<$Res>
    implements $TimerStateCopyWith<$Res> {
  factory _$$TimerStateImplCopyWith(
          _$TimerStateImpl value, $Res Function(_$TimerStateImpl) then) =
      __$$TimerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ClassroomTimer? currentTimer,
      Duration elapsedTime,
      bool isRunning,
      int currentPhaseIndex});

  @override
  $ClassroomTimerCopyWith<$Res>? get currentTimer;
}

/// @nodoc
class __$$TimerStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerStateImpl>
    implements _$$TimerStateImplCopyWith<$Res> {
  __$$TimerStateImplCopyWithImpl(
      _$TimerStateImpl _value, $Res Function(_$TimerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTimer = freezed,
    Object? elapsedTime = null,
    Object? isRunning = null,
    Object? currentPhaseIndex = null,
  }) {
    return _then(_$TimerStateImpl(
      currentTimer: freezed == currentTimer
          ? _value.currentTimer
          : currentTimer // ignore: cast_nullable_to_non_nullable
              as ClassroomTimer?,
      elapsedTime: null == elapsedTime
          ? _value.elapsedTime
          : elapsedTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      isRunning: null == isRunning
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPhaseIndex: null == currentPhaseIndex
          ? _value.currentPhaseIndex
          : currentPhaseIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TimerStateImpl extends _TimerState {
  const _$TimerStateImpl(
      {this.currentTimer,
      this.elapsedTime = Duration.zero,
      this.isRunning = false,
      this.currentPhaseIndex = 0})
      : super._();

  @override
  final ClassroomTimer? currentTimer;
  @override
  @JsonKey()
  final Duration elapsedTime;
  @override
  @JsonKey()
  final bool isRunning;
  @override
  @JsonKey()
  final int currentPhaseIndex;

  @override
  String toString() {
    return 'TimerState(currentTimer: $currentTimer, elapsedTime: $elapsedTime, isRunning: $isRunning, currentPhaseIndex: $currentPhaseIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerStateImpl &&
            (identical(other.currentTimer, currentTimer) ||
                other.currentTimer == currentTimer) &&
            (identical(other.elapsedTime, elapsedTime) ||
                other.elapsedTime == elapsedTime) &&
            (identical(other.isRunning, isRunning) ||
                other.isRunning == isRunning) &&
            (identical(other.currentPhaseIndex, currentPhaseIndex) ||
                other.currentPhaseIndex == currentPhaseIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, currentTimer, elapsedTime, isRunning, currentPhaseIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerStateImplCopyWith<_$TimerStateImpl> get copyWith =>
      __$$TimerStateImplCopyWithImpl<_$TimerStateImpl>(this, _$identity);
}

abstract class _TimerState extends TimerState {
  const factory _TimerState(
      {final ClassroomTimer? currentTimer,
      final Duration elapsedTime,
      final bool isRunning,
      final int currentPhaseIndex}) = _$TimerStateImpl;
  const _TimerState._() : super._();

  @override
  ClassroomTimer? get currentTimer;
  @override
  Duration get elapsedTime;
  @override
  bool get isRunning;
  @override
  int get currentPhaseIndex;
  @override
  @JsonKey(ignore: true)
  _$$TimerStateImplCopyWith<_$TimerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
