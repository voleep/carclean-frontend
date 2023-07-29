// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) {
  return _VehicleModel.fromJson(json);
}

/// @nodoc
mixin _$VehicleModel {
  String? get vehicleId => throw _privateConstructorUsedError;
  String get licensePlate => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get modelYear => throw _privateConstructorUsedError;
  CustomerModel? get customer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleModelCopyWith<VehicleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleModelCopyWith<$Res> {
  factory $VehicleModelCopyWith(
          VehicleModel value, $Res Function(VehicleModel) then) =
      _$VehicleModelCopyWithImpl<$Res, VehicleModel>;
  @useResult
  $Res call(
      {String? vehicleId,
      String licensePlate,
      String description,
      String? modelYear,
      CustomerModel? customer});

  $CustomerModelCopyWith<$Res>? get customer;
}

/// @nodoc
class _$VehicleModelCopyWithImpl<$Res, $Val extends VehicleModel>
    implements $VehicleModelCopyWith<$Res> {
  _$VehicleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleId = freezed,
    Object? licensePlate = null,
    Object? description = null,
    Object? modelYear = freezed,
    Object? customer = freezed,
  }) {
    return _then(_value.copyWith(
      vehicleId: freezed == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String?,
      licensePlate: null == licensePlate
          ? _value.licensePlate
          : licensePlate // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      modelYear: freezed == modelYear
          ? _value.modelYear
          : modelYear // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerModelCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerModelCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_VehicleModelCopyWith<$Res>
    implements $VehicleModelCopyWith<$Res> {
  factory _$$_VehicleModelCopyWith(
          _$_VehicleModel value, $Res Function(_$_VehicleModel) then) =
      __$$_VehicleModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? vehicleId,
      String licensePlate,
      String description,
      String? modelYear,
      CustomerModel? customer});

  @override
  $CustomerModelCopyWith<$Res>? get customer;
}

/// @nodoc
class __$$_VehicleModelCopyWithImpl<$Res>
    extends _$VehicleModelCopyWithImpl<$Res, _$_VehicleModel>
    implements _$$_VehicleModelCopyWith<$Res> {
  __$$_VehicleModelCopyWithImpl(
      _$_VehicleModel _value, $Res Function(_$_VehicleModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleId = freezed,
    Object? licensePlate = null,
    Object? description = null,
    Object? modelYear = freezed,
    Object? customer = freezed,
  }) {
    return _then(_$_VehicleModel(
      vehicleId: freezed == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String?,
      licensePlate: null == licensePlate
          ? _value.licensePlate
          : licensePlate // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      modelYear: freezed == modelYear
          ? _value.modelYear
          : modelYear // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VehicleModel with DiagnosticableTreeMixin implements _VehicleModel {
  const _$_VehicleModel(
      {this.vehicleId,
      required this.licensePlate,
      required this.description,
      this.modelYear,
      this.customer});

  factory _$_VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$$_VehicleModelFromJson(json);

  @override
  final String? vehicleId;
  @override
  final String licensePlate;
  @override
  final String description;
  @override
  final String? modelYear;
  @override
  final CustomerModel? customer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VehicleModel(vehicleId: $vehicleId, licensePlate: $licensePlate, description: $description, modelYear: $modelYear, customer: $customer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VehicleModel'))
      ..add(DiagnosticsProperty('vehicleId', vehicleId))
      ..add(DiagnosticsProperty('licensePlate', licensePlate))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('modelYear', modelYear))
      ..add(DiagnosticsProperty('customer', customer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VehicleModel &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.licensePlate, licensePlate) ||
                other.licensePlate == licensePlate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.modelYear, modelYear) ||
                other.modelYear == modelYear) &&
            (identical(other.customer, customer) ||
                other.customer == customer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, vehicleId, licensePlate, description, modelYear, customer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VehicleModelCopyWith<_$_VehicleModel> get copyWith =>
      __$$_VehicleModelCopyWithImpl<_$_VehicleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VehicleModelToJson(
      this,
    );
  }
}

abstract class _VehicleModel implements VehicleModel {
  const factory _VehicleModel(
      {final String? vehicleId,
      required final String licensePlate,
      required final String description,
      final String? modelYear,
      final CustomerModel? customer}) = _$_VehicleModel;

  factory _VehicleModel.fromJson(Map<String, dynamic> json) =
      _$_VehicleModel.fromJson;

  @override
  String? get vehicleId;
  @override
  String get licensePlate;
  @override
  String get description;
  @override
  String? get modelYear;
  @override
  CustomerModel? get customer;
  @override
  @JsonKey(ignore: true)
  _$$_VehicleModelCopyWith<_$_VehicleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
