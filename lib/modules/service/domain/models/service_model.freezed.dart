// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) {
  return _ServiceModel.fromJson(json);
}

/// @nodoc
mixin _$ServiceModel {
  String get serviceId => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get fullDescription => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get pcCommission => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceModelCopyWith<ServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceModelCopyWith<$Res> {
  factory $ServiceModelCopyWith(
          ServiceModel value, $Res Function(ServiceModel) then) =
      _$ServiceModelCopyWithImpl<$Res, ServiceModel>;
  @useResult
  $Res call(
      {String serviceId,
      int code,
      String description,
      String fullDescription,
      double price,
      double pcCommission});
}

/// @nodoc
class _$ServiceModelCopyWithImpl<$Res, $Val extends ServiceModel>
    implements $ServiceModelCopyWith<$Res> {
  _$ServiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? code = null,
    Object? description = null,
    Object? fullDescription = null,
    Object? price = null,
    Object? pcCommission = null,
  }) {
    return _then(_value.copyWith(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      fullDescription: null == fullDescription
          ? _value.fullDescription
          : fullDescription // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      pcCommission: null == pcCommission
          ? _value.pcCommission
          : pcCommission // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServiceModelCopyWith<$Res>
    implements $ServiceModelCopyWith<$Res> {
  factory _$$_ServiceModelCopyWith(
          _$_ServiceModel value, $Res Function(_$_ServiceModel) then) =
      __$$_ServiceModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String serviceId,
      int code,
      String description,
      String fullDescription,
      double price,
      double pcCommission});
}

/// @nodoc
class __$$_ServiceModelCopyWithImpl<$Res>
    extends _$ServiceModelCopyWithImpl<$Res, _$_ServiceModel>
    implements _$$_ServiceModelCopyWith<$Res> {
  __$$_ServiceModelCopyWithImpl(
      _$_ServiceModel _value, $Res Function(_$_ServiceModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? code = null,
    Object? description = null,
    Object? fullDescription = null,
    Object? price = null,
    Object? pcCommission = null,
  }) {
    return _then(_$_ServiceModel(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      fullDescription: null == fullDescription
          ? _value.fullDescription
          : fullDescription // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      pcCommission: null == pcCommission
          ? _value.pcCommission
          : pcCommission // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceModel with DiagnosticableTreeMixin implements _ServiceModel {
  const _$_ServiceModel(
      {required this.serviceId,
      required this.code,
      required this.description,
      required this.fullDescription,
      required this.price,
      required this.pcCommission});

  factory _$_ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceModelFromJson(json);

  @override
  final String serviceId;
  @override
  final int code;
  @override
  final String description;
  @override
  final String fullDescription;
  @override
  final double price;
  @override
  final double pcCommission;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServiceModel(serviceId: $serviceId, code: $code, description: $description, fullDescription: $fullDescription, price: $price, pcCommission: $pcCommission)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServiceModel'))
      ..add(DiagnosticsProperty('serviceId', serviceId))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('fullDescription', fullDescription))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('pcCommission', pcCommission));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceModel &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.fullDescription, fullDescription) ||
                other.fullDescription == fullDescription) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.pcCommission, pcCommission) ||
                other.pcCommission == pcCommission));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, serviceId, code, description,
      fullDescription, price, pcCommission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceModelCopyWith<_$_ServiceModel> get copyWith =>
      __$$_ServiceModelCopyWithImpl<_$_ServiceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceModelToJson(
      this,
    );
  }
}

abstract class _ServiceModel implements ServiceModel {
  const factory _ServiceModel(
      {required final String serviceId,
      required final int code,
      required final String description,
      required final String fullDescription,
      required final double price,
      required final double pcCommission}) = _$_ServiceModel;

  factory _ServiceModel.fromJson(Map<String, dynamic> json) =
      _$_ServiceModel.fromJson;

  @override
  String get serviceId;
  @override
  int get code;
  @override
  String get description;
  @override
  String get fullDescription;
  @override
  double get price;
  @override
  double get pcCommission;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceModelCopyWith<_$_ServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
