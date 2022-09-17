// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'guest_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GuestModel _$GuestModelFromJson(Map<String, dynamic> json) {
  return _GuestModel.fromJson(json);
}

/// @nodoc
mixin _$GuestModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  DateTime get joinedAt => throw _privateConstructorUsedError;
  String get origin => throw _privateConstructorUsedError;
  String get pngImgAssetName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuestModelCopyWith<GuestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestModelCopyWith<$Res> {
  factory $GuestModelCopyWith(
          GuestModel value, $Res Function(GuestModel) then) =
      _$GuestModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String email,
      String phoneNumber,
      DateTime joinedAt,
      String origin,
      String pngImgAssetName});
}

/// @nodoc
class _$GuestModelCopyWithImpl<$Res> implements $GuestModelCopyWith<$Res> {
  _$GuestModelCopyWithImpl(this._value, this._then);

  final GuestModel _value;
  // ignore: unused_field
  final $Res Function(GuestModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? joinedAt = freezed,
    Object? origin = freezed,
    Object? pngImgAssetName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: joinedAt == freezed
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      origin: origin == freezed
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      pngImgAssetName: pngImgAssetName == freezed
          ? _value.pngImgAssetName
          : pngImgAssetName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_GuestModelCopyWith<$Res>
    implements $GuestModelCopyWith<$Res> {
  factory _$$_GuestModelCopyWith(
          _$_GuestModel value, $Res Function(_$_GuestModel) then) =
      __$$_GuestModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String email,
      String phoneNumber,
      DateTime joinedAt,
      String origin,
      String pngImgAssetName});
}

/// @nodoc
class __$$_GuestModelCopyWithImpl<$Res> extends _$GuestModelCopyWithImpl<$Res>
    implements _$$_GuestModelCopyWith<$Res> {
  __$$_GuestModelCopyWithImpl(
      _$_GuestModel _value, $Res Function(_$_GuestModel) _then)
      : super(_value, (v) => _then(v as _$_GuestModel));

  @override
  _$_GuestModel get _value => super._value as _$_GuestModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? joinedAt = freezed,
    Object? origin = freezed,
    Object? pngImgAssetName = freezed,
  }) {
    return _then(_$_GuestModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: joinedAt == freezed
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      origin: origin == freezed
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      pngImgAssetName: pngImgAssetName == freezed
          ? _value.pngImgAssetName
          : pngImgAssetName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GuestModel implements _GuestModel {
  const _$_GuestModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.joinedAt,
      required this.origin,
      required this.pngImgAssetName});

  factory _$_GuestModel.fromJson(Map<String, dynamic> json) =>
      _$$_GuestModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final DateTime joinedAt;
  @override
  final String origin;
  @override
  final String pngImgAssetName;

  @override
  String toString() {
    return 'GuestModel(id: $id, name: $name, email: $email, phoneNumber: $phoneNumber, joinedAt: $joinedAt, origin: $origin, pngImgAssetName: $pngImgAssetName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GuestModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.joinedAt, joinedAt) &&
            const DeepCollectionEquality().equals(other.origin, origin) &&
            const DeepCollectionEquality()
                .equals(other.pngImgAssetName, pngImgAssetName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(joinedAt),
      const DeepCollectionEquality().hash(origin),
      const DeepCollectionEquality().hash(pngImgAssetName));

  @JsonKey(ignore: true)
  @override
  _$$_GuestModelCopyWith<_$_GuestModel> get copyWith =>
      __$$_GuestModelCopyWithImpl<_$_GuestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GuestModelToJson(
      this,
    );
  }
}

abstract class _GuestModel implements GuestModel {
  const factory _GuestModel(
      {required final int id,
      required final String name,
      required final String email,
      required final String phoneNumber,
      required final DateTime joinedAt,
      required final String origin,
      required final String pngImgAssetName}) = _$_GuestModel;

  factory _GuestModel.fromJson(Map<String, dynamic> json) =
      _$_GuestModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  DateTime get joinedAt;
  @override
  String get origin;
  @override
  String get pngImgAssetName;
  @override
  @JsonKey(ignore: true)
  _$$_GuestModelCopyWith<_$_GuestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
