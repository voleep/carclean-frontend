// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) {
  return _AuthModel.fromJson(json);
}

/// @nodoc
mixin _$AuthModel {
  String get userId => throw _privateConstructorUsedError;
  String? get businessId => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthModelCopyWith<AuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthModelCopyWith<$Res> {
  factory $AuthModelCopyWith(AuthModel value, $Res Function(AuthModel) then) =
      _$AuthModelCopyWithImpl<$Res, AuthModel>;
  @useResult
  $Res call(
      {String userId, String? businessId, String token, String refreshToken});
}

/// @nodoc
class _$AuthModelCopyWithImpl<$Res, $Val extends AuthModel>
    implements $AuthModelCopyWith<$Res> {
  _$AuthModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? businessId = freezed,
    Object? token = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      businessId: freezed == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as String?,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthModelCopyWith<$Res> implements $AuthModelCopyWith<$Res> {
  factory _$$_AuthModelCopyWith(
          _$_AuthModel value, $Res Function(_$_AuthModel) then) =
      __$$_AuthModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId, String? businessId, String token, String refreshToken});
}

/// @nodoc
class __$$_AuthModelCopyWithImpl<$Res>
    extends _$AuthModelCopyWithImpl<$Res, _$_AuthModel>
    implements _$$_AuthModelCopyWith<$Res> {
  __$$_AuthModelCopyWithImpl(
      _$_AuthModel _value, $Res Function(_$_AuthModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? businessId = freezed,
    Object? token = null,
    Object? refreshToken = null,
  }) {
    return _then(_$_AuthModel(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      businessId: freezed == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as String?,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthModel with DiagnosticableTreeMixin implements _AuthModel {
  const _$_AuthModel(
      {required this.userId,
      required this.businessId,
      required this.token,
      required this.refreshToken});

  factory _$_AuthModel.fromJson(Map<String, dynamic> json) =>
      _$$_AuthModelFromJson(json);

  @override
  final String userId;
  @override
  final String? businessId;
  @override
  final String token;
  @override
  final String refreshToken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthModel(userId: $userId, businessId: $businessId, token: $token, refreshToken: $refreshToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthModel'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('businessId', businessId))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('refreshToken', refreshToken));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, businessId, token, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthModelCopyWith<_$_AuthModel> get copyWith =>
      __$$_AuthModelCopyWithImpl<_$_AuthModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthModelToJson(
      this,
    );
  }
}

abstract class _AuthModel implements AuthModel {
  const factory _AuthModel(
      {required final String userId,
      required final String? businessId,
      required final String token,
      required final String refreshToken}) = _$_AuthModel;

  factory _AuthModel.fromJson(Map<String, dynamic> json) =
      _$_AuthModel.fromJson;

  @override
  String get userId;
  @override
  String? get businessId;
  @override
  String get token;
  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$_AuthModelCopyWith<_$_AuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}
