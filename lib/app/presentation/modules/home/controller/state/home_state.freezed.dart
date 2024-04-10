// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  bool get loading => throw _privateConstructorUsedError;
  List<Media>? get moviesAndSeries => throw _privateConstructorUsedError;
  TimeWindow get timeWindow => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {bool loading, List<Media>? moviesAndSeries, TimeWindow timeWindow});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? moviesAndSeries = freezed,
    Object? timeWindow = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      moviesAndSeries: freezed == moviesAndSeries
          ? _value.moviesAndSeries
          : moviesAndSeries // ignore: cast_nullable_to_non_nullable
              as List<Media>?,
      timeWindow: null == timeWindow
          ? _value.timeWindow
          : timeWindow // ignore: cast_nullable_to_non_nullable
              as TimeWindow,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading, List<Media>? moviesAndSeries, TimeWindow timeWindow});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? moviesAndSeries = freezed,
    Object? timeWindow = null,
  }) {
    return _then(_$HomeStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      moviesAndSeries: freezed == moviesAndSeries
          ? _value._moviesAndSeries
          : moviesAndSeries // ignore: cast_nullable_to_non_nullable
              as List<Media>?,
      timeWindow: null == timeWindow
          ? _value.timeWindow
          : timeWindow // ignore: cast_nullable_to_non_nullable
              as TimeWindow,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  _$HomeStateImpl(
      {required this.loading,
      final List<Media>? moviesAndSeries,
      this.timeWindow = TimeWindow.day})
      : _moviesAndSeries = moviesAndSeries;

  @override
  final bool loading;
  final List<Media>? _moviesAndSeries;
  @override
  List<Media>? get moviesAndSeries {
    final value = _moviesAndSeries;
    if (value == null) return null;
    if (_moviesAndSeries is EqualUnmodifiableListView) return _moviesAndSeries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final TimeWindow timeWindow;

  @override
  String toString() {
    return 'HomeState(loading: $loading, moviesAndSeries: $moviesAndSeries, timeWindow: $timeWindow)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other._moviesAndSeries, _moviesAndSeries) &&
            (identical(other.timeWindow, timeWindow) ||
                other.timeWindow == timeWindow));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading,
      const DeepCollectionEquality().hash(_moviesAndSeries), timeWindow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {required final bool loading,
      final List<Media>? moviesAndSeries,
      final TimeWindow timeWindow}) = _$HomeStateImpl;

  @override
  bool get loading;
  @override
  List<Media>? get moviesAndSeries;
  @override
  TimeWindow get timeWindow;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
