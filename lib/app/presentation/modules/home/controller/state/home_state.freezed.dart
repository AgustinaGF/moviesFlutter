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
  TimeWindow get timeWindow => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TimeWindow timeWindow) loading,
    required TResult Function(TimeWindow timeWindow) failed,
    required TResult Function(
            TimeWindow timeWindow, List<Media> moviesAndSeries)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TimeWindow timeWindow)? loading,
    TResult? Function(TimeWindow timeWindow)? failed,
    TResult? Function(TimeWindow timeWindow, List<Media> moviesAndSeries)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TimeWindow timeWindow)? loading,
    TResult Function(TimeWindow timeWindow)? failed,
    TResult Function(TimeWindow timeWindow, List<Media> moviesAndSeries)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateFailed value) failed,
    required TResult Function(HomeStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateFailed value)? failed,
    TResult? Function(HomeStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateFailed value)? failed,
    TResult Function(HomeStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({TimeWindow timeWindow});
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
    Object? timeWindow = null,
  }) {
    return _then(_value.copyWith(
      timeWindow: null == timeWindow
          ? _value.timeWindow
          : timeWindow // ignore: cast_nullable_to_non_nullable
              as TimeWindow,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateLoadingImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateLoadingImplCopyWith(_$HomeStateLoadingImpl value,
          $Res Function(_$HomeStateLoadingImpl) then) =
      __$$HomeStateLoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TimeWindow timeWindow});
}

/// @nodoc
class __$$HomeStateLoadingImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateLoadingImpl>
    implements _$$HomeStateLoadingImplCopyWith<$Res> {
  __$$HomeStateLoadingImplCopyWithImpl(_$HomeStateLoadingImpl _value,
      $Res Function(_$HomeStateLoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeWindow = null,
  }) {
    return _then(_$HomeStateLoadingImpl(
      null == timeWindow
          ? _value.timeWindow
          : timeWindow // ignore: cast_nullable_to_non_nullable
              as TimeWindow,
    ));
  }
}

/// @nodoc

class _$HomeStateLoadingImpl implements HomeStateLoading {
  _$HomeStateLoadingImpl(this.timeWindow);

  @override
  final TimeWindow timeWindow;

  @override
  String toString() {
    return 'HomeState.loading(timeWindow: $timeWindow)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateLoadingImpl &&
            (identical(other.timeWindow, timeWindow) ||
                other.timeWindow == timeWindow));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timeWindow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateLoadingImplCopyWith<_$HomeStateLoadingImpl> get copyWith =>
      __$$HomeStateLoadingImplCopyWithImpl<_$HomeStateLoadingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TimeWindow timeWindow) loading,
    required TResult Function(TimeWindow timeWindow) failed,
    required TResult Function(
            TimeWindow timeWindow, List<Media> moviesAndSeries)
        loaded,
  }) {
    return loading(timeWindow);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TimeWindow timeWindow)? loading,
    TResult? Function(TimeWindow timeWindow)? failed,
    TResult? Function(TimeWindow timeWindow, List<Media> moviesAndSeries)?
        loaded,
  }) {
    return loading?.call(timeWindow);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TimeWindow timeWindow)? loading,
    TResult Function(TimeWindow timeWindow)? failed,
    TResult Function(TimeWindow timeWindow, List<Media> moviesAndSeries)?
        loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(timeWindow);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateFailed value) failed,
    required TResult Function(HomeStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateFailed value)? failed,
    TResult? Function(HomeStateLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateFailed value)? failed,
    TResult Function(HomeStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomeStateLoading implements HomeState {
  factory HomeStateLoading(final TimeWindow timeWindow) =
      _$HomeStateLoadingImpl;

  @override
  TimeWindow get timeWindow;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateLoadingImplCopyWith<_$HomeStateLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeStateFailedImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateFailedImplCopyWith(_$HomeStateFailedImpl value,
          $Res Function(_$HomeStateFailedImpl) then) =
      __$$HomeStateFailedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TimeWindow timeWindow});
}

/// @nodoc
class __$$HomeStateFailedImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateFailedImpl>
    implements _$$HomeStateFailedImplCopyWith<$Res> {
  __$$HomeStateFailedImplCopyWithImpl(
      _$HomeStateFailedImpl _value, $Res Function(_$HomeStateFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeWindow = null,
  }) {
    return _then(_$HomeStateFailedImpl(
      null == timeWindow
          ? _value.timeWindow
          : timeWindow // ignore: cast_nullable_to_non_nullable
              as TimeWindow,
    ));
  }
}

/// @nodoc

class _$HomeStateFailedImpl implements HomeStateFailed {
  _$HomeStateFailedImpl(this.timeWindow);

  @override
  final TimeWindow timeWindow;

  @override
  String toString() {
    return 'HomeState.failed(timeWindow: $timeWindow)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateFailedImpl &&
            (identical(other.timeWindow, timeWindow) ||
                other.timeWindow == timeWindow));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timeWindow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateFailedImplCopyWith<_$HomeStateFailedImpl> get copyWith =>
      __$$HomeStateFailedImplCopyWithImpl<_$HomeStateFailedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TimeWindow timeWindow) loading,
    required TResult Function(TimeWindow timeWindow) failed,
    required TResult Function(
            TimeWindow timeWindow, List<Media> moviesAndSeries)
        loaded,
  }) {
    return failed(timeWindow);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TimeWindow timeWindow)? loading,
    TResult? Function(TimeWindow timeWindow)? failed,
    TResult? Function(TimeWindow timeWindow, List<Media> moviesAndSeries)?
        loaded,
  }) {
    return failed?.call(timeWindow);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TimeWindow timeWindow)? loading,
    TResult Function(TimeWindow timeWindow)? failed,
    TResult Function(TimeWindow timeWindow, List<Media> moviesAndSeries)?
        loaded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(timeWindow);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateFailed value) failed,
    required TResult Function(HomeStateLoaded value) loaded,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateFailed value)? failed,
    TResult? Function(HomeStateLoaded value)? loaded,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateFailed value)? failed,
    TResult Function(HomeStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class HomeStateFailed implements HomeState {
  factory HomeStateFailed(final TimeWindow timeWindow) = _$HomeStateFailedImpl;

  @override
  TimeWindow get timeWindow;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateFailedImplCopyWith<_$HomeStateFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeStateLoadedImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateLoadedImplCopyWith(_$HomeStateLoadedImpl value,
          $Res Function(_$HomeStateLoadedImpl) then) =
      __$$HomeStateLoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TimeWindow timeWindow, List<Media> moviesAndSeries});
}

/// @nodoc
class __$$HomeStateLoadedImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateLoadedImpl>
    implements _$$HomeStateLoadedImplCopyWith<$Res> {
  __$$HomeStateLoadedImplCopyWithImpl(
      _$HomeStateLoadedImpl _value, $Res Function(_$HomeStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeWindow = null,
    Object? moviesAndSeries = null,
  }) {
    return _then(_$HomeStateLoadedImpl(
      timeWindow: null == timeWindow
          ? _value.timeWindow
          : timeWindow // ignore: cast_nullable_to_non_nullable
              as TimeWindow,
      moviesAndSeries: null == moviesAndSeries
          ? _value._moviesAndSeries
          : moviesAndSeries // ignore: cast_nullable_to_non_nullable
              as List<Media>,
    ));
  }
}

/// @nodoc

class _$HomeStateLoadedImpl implements HomeStateLoaded {
  _$HomeStateLoadedImpl(
      {required this.timeWindow, required final List<Media> moviesAndSeries})
      : _moviesAndSeries = moviesAndSeries;

  @override
  final TimeWindow timeWindow;
  final List<Media> _moviesAndSeries;
  @override
  List<Media> get moviesAndSeries {
    if (_moviesAndSeries is EqualUnmodifiableListView) return _moviesAndSeries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moviesAndSeries);
  }

  @override
  String toString() {
    return 'HomeState.loaded(timeWindow: $timeWindow, moviesAndSeries: $moviesAndSeries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateLoadedImpl &&
            (identical(other.timeWindow, timeWindow) ||
                other.timeWindow == timeWindow) &&
            const DeepCollectionEquality()
                .equals(other._moviesAndSeries, _moviesAndSeries));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timeWindow,
      const DeepCollectionEquality().hash(_moviesAndSeries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateLoadedImplCopyWith<_$HomeStateLoadedImpl> get copyWith =>
      __$$HomeStateLoadedImplCopyWithImpl<_$HomeStateLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TimeWindow timeWindow) loading,
    required TResult Function(TimeWindow timeWindow) failed,
    required TResult Function(
            TimeWindow timeWindow, List<Media> moviesAndSeries)
        loaded,
  }) {
    return loaded(timeWindow, moviesAndSeries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TimeWindow timeWindow)? loading,
    TResult? Function(TimeWindow timeWindow)? failed,
    TResult? Function(TimeWindow timeWindow, List<Media> moviesAndSeries)?
        loaded,
  }) {
    return loaded?.call(timeWindow, moviesAndSeries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TimeWindow timeWindow)? loading,
    TResult Function(TimeWindow timeWindow)? failed,
    TResult Function(TimeWindow timeWindow, List<Media> moviesAndSeries)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(timeWindow, moviesAndSeries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateFailed value) failed,
    required TResult Function(HomeStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateFailed value)? failed,
    TResult? Function(HomeStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateFailed value)? failed,
    TResult Function(HomeStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class HomeStateLoaded implements HomeState {
  factory HomeStateLoaded(
      {required final TimeWindow timeWindow,
      required final List<Media> moviesAndSeries}) = _$HomeStateLoadedImpl;

  @override
  TimeWindow get timeWindow;
  List<Media> get moviesAndSeries;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateLoadedImplCopyWith<_$HomeStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
