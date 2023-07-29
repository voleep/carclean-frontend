// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceOrderModel _$ServiceOrderModelFromJson(Map<String, dynamic> json) {
  return _ServiceOrderModel.fromJson(json);
}

/// @nodoc
mixin _$ServiceOrderModel {
  CustomerModel get customer => throw _privateConstructorUsedError;
  VehicleModel get vehicle => throw _privateConstructorUsedError;
  double get discountTotal => throw _privateConstructorUsedError;
  double get netTotal => throw _privateConstructorUsedError;
  double get grossTotal => throw _privateConstructorUsedError;
  @Timestamp()
  DateTime get postingDate => throw _privateConstructorUsedError;
  List<ServiceOrderItemModel> get serviceOrderItemList =>
      throw _privateConstructorUsedError;
  List<ServiceOrderProductModel> get serviceOrderProductList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceOrderModelCopyWith<ServiceOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceOrderModelCopyWith<$Res> {
  factory $ServiceOrderModelCopyWith(
          ServiceOrderModel value, $Res Function(ServiceOrderModel) then) =
      _$ServiceOrderModelCopyWithImpl<$Res, ServiceOrderModel>;
  @useResult
  $Res call(
      {CustomerModel customer,
      VehicleModel vehicle,
      double discountTotal,
      double netTotal,
      double grossTotal,
      @Timestamp() DateTime postingDate,
      List<ServiceOrderItemModel> serviceOrderItemList,
      List<ServiceOrderProductModel> serviceOrderProductList});

  $CustomerModelCopyWith<$Res> get customer;
  $VehicleModelCopyWith<$Res> get vehicle;
}

/// @nodoc
class _$ServiceOrderModelCopyWithImpl<$Res, $Val extends ServiceOrderModel>
    implements $ServiceOrderModelCopyWith<$Res> {
  _$ServiceOrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? vehicle = null,
    Object? discountTotal = null,
    Object? netTotal = null,
    Object? grossTotal = null,
    Object? postingDate = null,
    Object? serviceOrderItemList = null,
    Object? serviceOrderProductList = null,
  }) {
    return _then(_value.copyWith(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerModel,
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as VehicleModel,
      discountTotal: null == discountTotal
          ? _value.discountTotal
          : discountTotal // ignore: cast_nullable_to_non_nullable
              as double,
      netTotal: null == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as double,
      grossTotal: null == grossTotal
          ? _value.grossTotal
          : grossTotal // ignore: cast_nullable_to_non_nullable
              as double,
      postingDate: null == postingDate
          ? _value.postingDate
          : postingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      serviceOrderItemList: null == serviceOrderItemList
          ? _value.serviceOrderItemList
          : serviceOrderItemList // ignore: cast_nullable_to_non_nullable
              as List<ServiceOrderItemModel>,
      serviceOrderProductList: null == serviceOrderProductList
          ? _value.serviceOrderProductList
          : serviceOrderProductList // ignore: cast_nullable_to_non_nullable
              as List<ServiceOrderProductModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerModelCopyWith<$Res> get customer {
    return $CustomerModelCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $VehicleModelCopyWith<$Res> get vehicle {
    return $VehicleModelCopyWith<$Res>(_value.vehicle, (value) {
      return _then(_value.copyWith(vehicle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ServiceOrderModelCopyWith<$Res>
    implements $ServiceOrderModelCopyWith<$Res> {
  factory _$$_ServiceOrderModelCopyWith(_$_ServiceOrderModel value,
          $Res Function(_$_ServiceOrderModel) then) =
      __$$_ServiceOrderModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CustomerModel customer,
      VehicleModel vehicle,
      double discountTotal,
      double netTotal,
      double grossTotal,
      @Timestamp() DateTime postingDate,
      List<ServiceOrderItemModel> serviceOrderItemList,
      List<ServiceOrderProductModel> serviceOrderProductList});

  @override
  $CustomerModelCopyWith<$Res> get customer;
  @override
  $VehicleModelCopyWith<$Res> get vehicle;
}

/// @nodoc
class __$$_ServiceOrderModelCopyWithImpl<$Res>
    extends _$ServiceOrderModelCopyWithImpl<$Res, _$_ServiceOrderModel>
    implements _$$_ServiceOrderModelCopyWith<$Res> {
  __$$_ServiceOrderModelCopyWithImpl(
      _$_ServiceOrderModel _value, $Res Function(_$_ServiceOrderModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? vehicle = null,
    Object? discountTotal = null,
    Object? netTotal = null,
    Object? grossTotal = null,
    Object? postingDate = null,
    Object? serviceOrderItemList = null,
    Object? serviceOrderProductList = null,
  }) {
    return _then(_$_ServiceOrderModel(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerModel,
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as VehicleModel,
      discountTotal: null == discountTotal
          ? _value.discountTotal
          : discountTotal // ignore: cast_nullable_to_non_nullable
              as double,
      netTotal: null == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as double,
      grossTotal: null == grossTotal
          ? _value.grossTotal
          : grossTotal // ignore: cast_nullable_to_non_nullable
              as double,
      postingDate: null == postingDate
          ? _value.postingDate
          : postingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      serviceOrderItemList: null == serviceOrderItemList
          ? _value._serviceOrderItemList
          : serviceOrderItemList // ignore: cast_nullable_to_non_nullable
              as List<ServiceOrderItemModel>,
      serviceOrderProductList: null == serviceOrderProductList
          ? _value._serviceOrderProductList
          : serviceOrderProductList // ignore: cast_nullable_to_non_nullable
              as List<ServiceOrderProductModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceOrderModel
    with DiagnosticableTreeMixin
    implements _ServiceOrderModel {
  const _$_ServiceOrderModel(
      {required this.customer,
      required this.vehicle,
      required this.discountTotal,
      required this.netTotal,
      required this.grossTotal,
      @Timestamp() required this.postingDate,
      required final List<ServiceOrderItemModel> serviceOrderItemList,
      required final List<ServiceOrderProductModel> serviceOrderProductList})
      : _serviceOrderItemList = serviceOrderItemList,
        _serviceOrderProductList = serviceOrderProductList;

  factory _$_ServiceOrderModel.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceOrderModelFromJson(json);

  @override
  final CustomerModel customer;
  @override
  final VehicleModel vehicle;
  @override
  final double discountTotal;
  @override
  final double netTotal;
  @override
  final double grossTotal;
  @override
  @Timestamp()
  final DateTime postingDate;
  final List<ServiceOrderItemModel> _serviceOrderItemList;
  @override
  List<ServiceOrderItemModel> get serviceOrderItemList {
    if (_serviceOrderItemList is EqualUnmodifiableListView)
      return _serviceOrderItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceOrderItemList);
  }

  final List<ServiceOrderProductModel> _serviceOrderProductList;
  @override
  List<ServiceOrderProductModel> get serviceOrderProductList {
    if (_serviceOrderProductList is EqualUnmodifiableListView)
      return _serviceOrderProductList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceOrderProductList);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServiceOrderModel(customer: $customer, vehicle: $vehicle, discountTotal: $discountTotal, netTotal: $netTotal, grossTotal: $grossTotal, postingDate: $postingDate, serviceOrderItemList: $serviceOrderItemList, serviceOrderProductList: $serviceOrderProductList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServiceOrderModel'))
      ..add(DiagnosticsProperty('customer', customer))
      ..add(DiagnosticsProperty('vehicle', vehicle))
      ..add(DiagnosticsProperty('discountTotal', discountTotal))
      ..add(DiagnosticsProperty('netTotal', netTotal))
      ..add(DiagnosticsProperty('grossTotal', grossTotal))
      ..add(DiagnosticsProperty('postingDate', postingDate))
      ..add(DiagnosticsProperty('serviceOrderItemList', serviceOrderItemList))
      ..add(DiagnosticsProperty(
          'serviceOrderProductList', serviceOrderProductList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceOrderModel &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            (identical(other.discountTotal, discountTotal) ||
                other.discountTotal == discountTotal) &&
            (identical(other.netTotal, netTotal) ||
                other.netTotal == netTotal) &&
            (identical(other.grossTotal, grossTotal) ||
                other.grossTotal == grossTotal) &&
            (identical(other.postingDate, postingDate) ||
                other.postingDate == postingDate) &&
            const DeepCollectionEquality()
                .equals(other._serviceOrderItemList, _serviceOrderItemList) &&
            const DeepCollectionEquality().equals(
                other._serviceOrderProductList, _serviceOrderProductList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customer,
      vehicle,
      discountTotal,
      netTotal,
      grossTotal,
      postingDate,
      const DeepCollectionEquality().hash(_serviceOrderItemList),
      const DeepCollectionEquality().hash(_serviceOrderProductList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceOrderModelCopyWith<_$_ServiceOrderModel> get copyWith =>
      __$$_ServiceOrderModelCopyWithImpl<_$_ServiceOrderModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceOrderModelToJson(
      this,
    );
  }
}

abstract class _ServiceOrderModel implements ServiceOrderModel {
  const factory _ServiceOrderModel(
      {required final CustomerModel customer,
      required final VehicleModel vehicle,
      required final double discountTotal,
      required final double netTotal,
      required final double grossTotal,
      @Timestamp() required final DateTime postingDate,
      required final List<ServiceOrderItemModel> serviceOrderItemList,
      required final List<ServiceOrderProductModel>
          serviceOrderProductList}) = _$_ServiceOrderModel;

  factory _ServiceOrderModel.fromJson(Map<String, dynamic> json) =
      _$_ServiceOrderModel.fromJson;

  @override
  CustomerModel get customer;
  @override
  VehicleModel get vehicle;
  @override
  double get discountTotal;
  @override
  double get netTotal;
  @override
  double get grossTotal;
  @override
  @Timestamp()
  DateTime get postingDate;
  @override
  List<ServiceOrderItemModel> get serviceOrderItemList;
  @override
  List<ServiceOrderProductModel> get serviceOrderProductList;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceOrderModelCopyWith<_$_ServiceOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
