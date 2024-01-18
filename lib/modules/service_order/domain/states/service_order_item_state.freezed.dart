// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_order_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServiceOrderItemState {
  String get uuid => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  ServiceModel get service => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  EmployeeModel? get employee => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceOrderItemStateCopyWith<ServiceOrderItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceOrderItemStateCopyWith<$Res> {
  factory $ServiceOrderItemStateCopyWith(ServiceOrderItemState value,
          $Res Function(ServiceOrderItemState) then) =
      _$ServiceOrderItemStateCopyWithImpl<$Res, ServiceOrderItemState>;
  @useResult
  $Res call(
      {String uuid,
      int number,
      ServiceModel service,
      double price,
      EmployeeModel? employee});
}

/// @nodoc
class _$ServiceOrderItemStateCopyWithImpl<$Res,
        $Val extends ServiceOrderItemState>
    implements $ServiceOrderItemStateCopyWith<$Res> {
  _$ServiceOrderItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? number = null,
    Object? service = null,
    Object? price = null,
    Object? employee = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as ServiceModel,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      employee: freezed == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as EmployeeModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServiceOrderItemStateCopyWith<$Res>
    implements $ServiceOrderItemStateCopyWith<$Res> {
  factory _$$_ServiceOrderItemStateCopyWith(_$_ServiceOrderItemState value,
          $Res Function(_$_ServiceOrderItemState) then) =
      __$$_ServiceOrderItemStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      int number,
      ServiceModel service,
      double price,
      EmployeeModel? employee});
}

/// @nodoc
class __$$_ServiceOrderItemStateCopyWithImpl<$Res>
    extends _$ServiceOrderItemStateCopyWithImpl<$Res, _$_ServiceOrderItemState>
    implements _$$_ServiceOrderItemStateCopyWith<$Res> {
  __$$_ServiceOrderItemStateCopyWithImpl(_$_ServiceOrderItemState _value,
      $Res Function(_$_ServiceOrderItemState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? number = null,
    Object? service = null,
    Object? price = null,
    Object? employee = freezed,
  }) {
    return _then(_$_ServiceOrderItemState(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as ServiceModel,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      employee: freezed == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as EmployeeModel?,
    ));
  }
}

/// @nodoc

class _$_ServiceOrderItemState implements _ServiceOrderItemState {
  _$_ServiceOrderItemState(
      {required this.uuid,
      required this.number,
      required this.service,
      required this.price,
      this.employee});

  @override
  final String uuid;
  @override
  final int number;
  @override
  final ServiceModel service;
  @override
  final double price;
  @override
  final EmployeeModel? employee;

  @override
  String toString() {
    return 'ServiceOrderItemState(uuid: $uuid, number: $number, service: $service, price: $price, employee: $employee)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceOrderItemState &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.employee, employee) ||
                other.employee == employee));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, uuid, number, service, price, employee);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceOrderItemStateCopyWith<_$_ServiceOrderItemState> get copyWith =>
      __$$_ServiceOrderItemStateCopyWithImpl<_$_ServiceOrderItemState>(
          this, _$identity);
}

abstract class _ServiceOrderItemState implements ServiceOrderItemState {
  factory _ServiceOrderItemState(
      {required final String uuid,
      required final int number,
      required final ServiceModel service,
      required final double price,
      final EmployeeModel? employee}) = _$_ServiceOrderItemState;

  @override
  String get uuid;
  @override
  int get number;
  @override
  ServiceModel get service;
  @override
  double get price;
  @override
  EmployeeModel? get employee;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceOrderItemStateCopyWith<_$_ServiceOrderItemState> get copyWith =>
      throw _privateConstructorUsedError;
}
