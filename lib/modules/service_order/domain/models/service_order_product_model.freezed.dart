// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_order_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceOrderProductModel _$ServiceOrderProductModelFromJson(
    Map<String, dynamic> json) {
  return _ServiceOrderProductModel.fromJson(json);
}

/// @nodoc
mixin _$ServiceOrderProductModel {
  String? get serviceOrderProductId => throw _privateConstructorUsedError;
  ProductModel get product => throw _privateConstructorUsedError;
  EmployeeModel? get employee => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceOrderProductModelCopyWith<ServiceOrderProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceOrderProductModelCopyWith<$Res> {
  factory $ServiceOrderProductModelCopyWith(ServiceOrderProductModel value,
          $Res Function(ServiceOrderProductModel) then) =
      _$ServiceOrderProductModelCopyWithImpl<$Res, ServiceOrderProductModel>;
  @useResult
  $Res call(
      {String? serviceOrderProductId,
      ProductModel product,
      EmployeeModel? employee,
      double quantity,
      double price});
}

/// @nodoc
class _$ServiceOrderProductModelCopyWithImpl<$Res,
        $Val extends ServiceOrderProductModel>
    implements $ServiceOrderProductModelCopyWith<$Res> {
  _$ServiceOrderProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceOrderProductId = freezed,
    Object? product = null,
    Object? employee = freezed,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      serviceOrderProductId: freezed == serviceOrderProductId
          ? _value.serviceOrderProductId
          : serviceOrderProductId // ignore: cast_nullable_to_non_nullable
              as String?,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      employee: freezed == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as EmployeeModel?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServiceOrderProductModelCopyWith<$Res>
    implements $ServiceOrderProductModelCopyWith<$Res> {
  factory _$$_ServiceOrderProductModelCopyWith(
          _$_ServiceOrderProductModel value,
          $Res Function(_$_ServiceOrderProductModel) then) =
      __$$_ServiceOrderProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? serviceOrderProductId,
      ProductModel product,
      EmployeeModel? employee,
      double quantity,
      double price});
}

/// @nodoc
class __$$_ServiceOrderProductModelCopyWithImpl<$Res>
    extends _$ServiceOrderProductModelCopyWithImpl<$Res,
        _$_ServiceOrderProductModel>
    implements _$$_ServiceOrderProductModelCopyWith<$Res> {
  __$$_ServiceOrderProductModelCopyWithImpl(_$_ServiceOrderProductModel _value,
      $Res Function(_$_ServiceOrderProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceOrderProductId = freezed,
    Object? product = null,
    Object? employee = freezed,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_$_ServiceOrderProductModel(
      serviceOrderProductId: freezed == serviceOrderProductId
          ? _value.serviceOrderProductId
          : serviceOrderProductId // ignore: cast_nullable_to_non_nullable
              as String?,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      employee: freezed == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as EmployeeModel?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceOrderProductModel
    with DiagnosticableTreeMixin
    implements _ServiceOrderProductModel {
  const _$_ServiceOrderProductModel(
      {this.serviceOrderProductId,
      required this.product,
      required this.employee,
      required this.quantity,
      required this.price});

  factory _$_ServiceOrderProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceOrderProductModelFromJson(json);

  @override
  final String? serviceOrderProductId;
  @override
  final ProductModel product;
  @override
  final EmployeeModel? employee;
  @override
  final double quantity;
  @override
  final double price;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServiceOrderProductModel(serviceOrderProductId: $serviceOrderProductId, product: $product, employee: $employee, quantity: $quantity, price: $price)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServiceOrderProductModel'))
      ..add(DiagnosticsProperty('serviceOrderProductId', serviceOrderProductId))
      ..add(DiagnosticsProperty('product', product))
      ..add(DiagnosticsProperty('employee', employee))
      ..add(DiagnosticsProperty('quantity', quantity))
      ..add(DiagnosticsProperty('price', price));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceOrderProductModel &&
            (identical(other.serviceOrderProductId, serviceOrderProductId) ||
                other.serviceOrderProductId == serviceOrderProductId) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.employee, employee) ||
                other.employee == employee) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, serviceOrderProductId, product, employee, quantity, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceOrderProductModelCopyWith<_$_ServiceOrderProductModel>
      get copyWith => __$$_ServiceOrderProductModelCopyWithImpl<
          _$_ServiceOrderProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceOrderProductModelToJson(
      this,
    );
  }
}

abstract class _ServiceOrderProductModel implements ServiceOrderProductModel {
  const factory _ServiceOrderProductModel(
      {final String? serviceOrderProductId,
      required final ProductModel product,
      required final EmployeeModel? employee,
      required final double quantity,
      required final double price}) = _$_ServiceOrderProductModel;

  factory _ServiceOrderProductModel.fromJson(Map<String, dynamic> json) =
      _$_ServiceOrderProductModel.fromJson;

  @override
  String? get serviceOrderProductId;
  @override
  ProductModel get product;
  @override
  EmployeeModel? get employee;
  @override
  double get quantity;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceOrderProductModelCopyWith<_$_ServiceOrderProductModel>
      get copyWith => throw _privateConstructorUsedError;
}
