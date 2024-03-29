// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_order_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceOrderItemModel _$ServiceOrderItemModelFromJson(
    Map<String, dynamic> json) {
  return _ServiceOrderItemModel.fromJson(json);
}

/// @nodoc
mixin _$ServiceOrderItemModel {
  String? get serviceOrderItemId => throw _privateConstructorUsedError;
  ServiceModel get service => throw _privateConstructorUsedError;
  EmployeeModel? get employee => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceOrderItemModelCopyWith<ServiceOrderItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceOrderItemModelCopyWith<$Res> {
  factory $ServiceOrderItemModelCopyWith(ServiceOrderItemModel value,
          $Res Function(ServiceOrderItemModel) then) =
      _$ServiceOrderItemModelCopyWithImpl<$Res, ServiceOrderItemModel>;
  @useResult
  $Res call(
      {String? serviceOrderItemId,
      ServiceModel service,
      EmployeeModel? employee,
      double price});
}

/// @nodoc
class _$ServiceOrderItemModelCopyWithImpl<$Res,
        $Val extends ServiceOrderItemModel>
    implements $ServiceOrderItemModelCopyWith<$Res> {
  _$ServiceOrderItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceOrderItemId = freezed,
    Object? service = null,
    Object? employee = freezed,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      serviceOrderItemId: freezed == serviceOrderItemId
          ? _value.serviceOrderItemId
          : serviceOrderItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as ServiceModel,
      employee: freezed == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as EmployeeModel?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServiceOrderItemModelCopyWith<$Res>
    implements $ServiceOrderItemModelCopyWith<$Res> {
  factory _$$_ServiceOrderItemModelCopyWith(_$_ServiceOrderItemModel value,
          $Res Function(_$_ServiceOrderItemModel) then) =
      __$$_ServiceOrderItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? serviceOrderItemId,
      ServiceModel service,
      EmployeeModel? employee,
      double price});
}

/// @nodoc
class __$$_ServiceOrderItemModelCopyWithImpl<$Res>
    extends _$ServiceOrderItemModelCopyWithImpl<$Res, _$_ServiceOrderItemModel>
    implements _$$_ServiceOrderItemModelCopyWith<$Res> {
  __$$_ServiceOrderItemModelCopyWithImpl(_$_ServiceOrderItemModel _value,
      $Res Function(_$_ServiceOrderItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceOrderItemId = freezed,
    Object? service = null,
    Object? employee = freezed,
    Object? price = null,
  }) {
    return _then(_$_ServiceOrderItemModel(
      serviceOrderItemId: freezed == serviceOrderItemId
          ? _value.serviceOrderItemId
          : serviceOrderItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as ServiceModel,
      employee: freezed == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as EmployeeModel?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceOrderItemModel
    with DiagnosticableTreeMixin
    implements _ServiceOrderItemModel {
  const _$_ServiceOrderItemModel(
      {this.serviceOrderItemId,
      required this.service,
      this.employee,
      required this.price});

  factory _$_ServiceOrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceOrderItemModelFromJson(json);

  @override
  final String? serviceOrderItemId;
  @override
  final ServiceModel service;
  @override
  final EmployeeModel? employee;
  @override
  final double price;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServiceOrderItemModel(serviceOrderItemId: $serviceOrderItemId, service: $service, employee: $employee, price: $price)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServiceOrderItemModel'))
      ..add(DiagnosticsProperty('serviceOrderItemId', serviceOrderItemId))
      ..add(DiagnosticsProperty('service', service))
      ..add(DiagnosticsProperty('employee', employee))
      ..add(DiagnosticsProperty('price', price));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceOrderItemModel &&
            (identical(other.serviceOrderItemId, serviceOrderItemId) ||
                other.serviceOrderItemId == serviceOrderItemId) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.employee, employee) ||
                other.employee == employee) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, serviceOrderItemId, service, employee, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceOrderItemModelCopyWith<_$_ServiceOrderItemModel> get copyWith =>
      __$$_ServiceOrderItemModelCopyWithImpl<_$_ServiceOrderItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceOrderItemModelToJson(
      this,
    );
  }
}

abstract class _ServiceOrderItemModel implements ServiceOrderItemModel {
  const factory _ServiceOrderItemModel(
      {final String? serviceOrderItemId,
      required final ServiceModel service,
      final EmployeeModel? employee,
      required final double price}) = _$_ServiceOrderItemModel;

  factory _ServiceOrderItemModel.fromJson(Map<String, dynamic> json) =
      _$_ServiceOrderItemModel.fromJson;

  @override
  String? get serviceOrderItemId;
  @override
  ServiceModel get service;
  @override
  EmployeeModel? get employee;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceOrderItemModelCopyWith<_$_ServiceOrderItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
