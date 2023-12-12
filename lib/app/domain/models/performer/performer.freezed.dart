// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'performer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Performer _$PerformerFromJson(Map<String, dynamic> json) {
  return _Performer.fromJson(json);
}

/// @nodoc
mixin _$Performer {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_name')
  String get originalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_path')
  String get profilePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'know_for', fromJson: getMediaList)
  List<Media> get knownFor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PerformerCopyWith<Performer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformerCopyWith<$Res> {
  factory $PerformerCopyWith(Performer value, $Res Function(Performer) then) =
      _$PerformerCopyWithImpl<$Res, Performer>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'original_name') String originalName,
      @JsonKey(name: 'profile_path') String profilePath,
      @JsonKey(name: 'know_for', fromJson: getMediaList) List<Media> knownFor});
}

/// @nodoc
class _$PerformerCopyWithImpl<$Res, $Val extends Performer>
    implements $PerformerCopyWith<$Res> {
  _$PerformerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? originalName = null,
    Object? profilePath = null,
    Object? knownFor = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePath: null == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String,
      knownFor: null == knownFor
          ? _value.knownFor
          : knownFor // ignore: cast_nullable_to_non_nullable
              as List<Media>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerformerImplCopyWith<$Res>
    implements $PerformerCopyWith<$Res> {
  factory _$$PerformerImplCopyWith(
          _$PerformerImpl value, $Res Function(_$PerformerImpl) then) =
      __$$PerformerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'original_name') String originalName,
      @JsonKey(name: 'profile_path') String profilePath,
      @JsonKey(name: 'know_for', fromJson: getMediaList) List<Media> knownFor});
}

/// @nodoc
class __$$PerformerImplCopyWithImpl<$Res>
    extends _$PerformerCopyWithImpl<$Res, _$PerformerImpl>
    implements _$$PerformerImplCopyWith<$Res> {
  __$$PerformerImplCopyWithImpl(
      _$PerformerImpl _value, $Res Function(_$PerformerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? originalName = null,
    Object? profilePath = null,
    Object? knownFor = null,
  }) {
    return _then(_$PerformerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePath: null == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String,
      knownFor: null == knownFor
          ? _value._knownFor
          : knownFor // ignore: cast_nullable_to_non_nullable
              as List<Media>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformerImpl implements _Performer {
  _$PerformerImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'original_name') required this.originalName,
      @JsonKey(name: 'profile_path') required this.profilePath,
      @JsonKey(name: 'know_for', fromJson: getMediaList)
      required final List<Media> knownFor})
      : _knownFor = knownFor;

  factory _$PerformerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformerImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'original_name')
  final String originalName;
  @override
  @JsonKey(name: 'profile_path')
  final String profilePath;
  final List<Media> _knownFor;
  @override
  @JsonKey(name: 'know_for', fromJson: getMediaList)
  List<Media> get knownFor {
    if (_knownFor is EqualUnmodifiableListView) return _knownFor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_knownFor);
  }

  @override
  String toString() {
    return 'Performer(id: $id, name: $name, originalName: $originalName, profilePath: $profilePath, knownFor: $knownFor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath) &&
            const DeepCollectionEquality().equals(other._knownFor, _knownFor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, originalName,
      profilePath, const DeepCollectionEquality().hash(_knownFor));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformerImplCopyWith<_$PerformerImpl> get copyWith =>
      __$$PerformerImplCopyWithImpl<_$PerformerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformerImplToJson(
      this,
    );
  }
}

abstract class _Performer implements Performer {
  factory _Performer(
      {required final int id,
      required final String name,
      @JsonKey(name: 'original_name') required final String originalName,
      @JsonKey(name: 'profile_path') required final String profilePath,
      @JsonKey(name: 'know_for', fromJson: getMediaList)
      required final List<Media> knownFor}) = _$PerformerImpl;

  factory _Performer.fromJson(Map<String, dynamic> json) =
      _$PerformerImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'original_name')
  String get originalName;
  @override
  @JsonKey(name: 'profile_path')
  String get profilePath;
  @override
  @JsonKey(name: 'know_for', fromJson: getMediaList)
  List<Media> get knownFor;
  @override
  @JsonKey(ignore: true)
  _$$PerformerImplCopyWith<_$PerformerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
