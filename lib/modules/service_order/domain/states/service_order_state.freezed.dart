// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServiceOrderState {
  CustomerModel? get customer => throw _privateConstructorUsedError;
  VehicleModel? get vehicle => throw _privateConstructorUsedError;
  List<ServiceOrderItemState> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceOrderStateCopyWith<ServiceOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceOrderStateCopyWith<$Res> {
  factory $ServiceOrderStateCopyWith(
          ServiceOrderState value, $Res Function(ServiceOrderState) then) =
      _$ServiceOrderStateCopyWithImpl<$Res, ServiceOrderState>;
  @useResult
  $Res call(
      {CustomerModel? customer,
      VehicleModel? vehicle,
      List<ServiceOrderItemState> items});

  $CustomerModelCopyWith<$Res>? get customer;
}

/// @nodoc
class _$ServiceOrderStateCopyWithImpl<$Res, $Val extends ServiceOrderState>
    implements $ServiceOrderStateCopyWith<$Res> {
  _$ServiceOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = freezed,
    Object? vehicle = freezed,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerModel?,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as VehicleModel?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ServiceOrderItemState>,
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
abstract class _$$_ServiceOrderStateCopyWith<$Res>
    implements $ServiceOrderStateCopyWith<$Res> {
  factory _$$_ServiceOrderStateCopyWith(_$_ServiceOrderState value,
          $Res Function(_$_ServiceOrderState) then) =
      __$$_ServiceOrderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CustomerModel? customer,
      VehicleModel? vehicle,
      List<ServiceOrderItemState> items});

  @override
  $CustomerModelCopyWith<$Res>? get customer;
}

/// @nodoc
class __$$_ServiceOrderStateCopyWithImpl<$Res>
    extends _$ServiceOrderStateCopyWithImpl<$Res, _$_ServiceOrderState>
    implements _$$_ServiceOrderStateCopyWith<$Res> {
  __$$_ServiceOrderStateCopyWithImpl(
      _$_ServiceOrderState _value, $Res Function(_$_ServiceOrderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = freezed,
    Object? vehicle = freezed,
    Object? items = null,
  }) {
    return _then(_$_ServiceOrderState(
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerModel?,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as VehicleModel?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ServiceOrderItemState>,
    ));
  }
}

/// @nodoc

class _$_ServiceOrderState implements _ServiceOrderState {
  _$_ServiceOrderState(
      {this.customer,
      this.vehicle,
      final List<ServiceOrderItemState> items = const []})
      : _items = items;

  @override
  final CustomerModel? customer;
  @override
  final VehicleModel? vehicle;
  final List<ServiceOrderItemState> _items;
  @override
  @JsonKey()
  List<ServiceOrderItemState> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ServiceOrderState(customer: $customer, vehicle: $vehicle, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceOrderState &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customer, vehicle,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceOrderStateCopyWith<_$_ServiceOrderState> get copyWith =>
      __$$_ServiceOrderStateCopyWithImpl<_$_ServiceOrderState>(
          this, _$identity);
}

abstract class _ServiceOrderState implements ServiceOrderState {
  factory _ServiceOrderState(
      {final CustomerModel? customer,
      final VehicleModel? vehicle,
      final List<ServiceOrderItemState> items}) = _$_ServiceOrderState;

  @override
  CustomerModel? get customer;
  @override
  VehicleModel? get vehicle;
  @override
  List<ServiceOrderItemState> get items;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceOrderStateCopyWith<_$_ServiceOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}
