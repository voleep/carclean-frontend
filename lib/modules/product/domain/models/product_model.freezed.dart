// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String get productId => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get availableStock => throw _privateConstructorUsedError;
  double get pcCommission => throw _privateConstructorUsedError;
  int get situation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {String productId,
      int code,
      String description,
      double price,
      double availableStock,
      double pcCommission,
      int situation});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? code = null,
    Object? description = null,
    Object? price = null,
    Object? availableStock = null,
    Object? pcCommission = null,
    Object? situation = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      availableStock: null == availableStock
          ? _value.availableStock
          : availableStock // ignore: cast_nullable_to_non_nullable
              as double,
      pcCommission: null == pcCommission
          ? _value.pcCommission
          : pcCommission // ignore: cast_nullable_to_non_nullable
              as double,
      situation: null == situation
          ? _value.situation
          : situation // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$_ProductModelCopyWith(
          _$_ProductModel value, $Res Function(_$_ProductModel) then) =
      __$$_ProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId,
      int code,
      String description,
      double price,
      double availableStock,
      double pcCommission,
      int situation});
}

/// @nodoc
class __$$_ProductModelCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$_ProductModel>
    implements _$$_ProductModelCopyWith<$Res> {
  __$$_ProductModelCopyWithImpl(
      _$_ProductModel _value, $Res Function(_$_ProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? code = null,
    Object? description = null,
    Object? price = null,
    Object? availableStock = null,
    Object? pcCommission = null,
    Object? situation = null,
  }) {
    return _then(_$_ProductModel(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      availableStock: null == availableStock
          ? _value.availableStock
          : availableStock // ignore: cast_nullable_to_non_nullable
              as double,
      pcCommission: null == pcCommission
          ? _value.pcCommission
          : pcCommission // ignore: cast_nullable_to_non_nullable
              as double,
      situation: null == situation
          ? _value.situation
          : situation // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductModel with DiagnosticableTreeMixin implements _ProductModel {
  const _$_ProductModel(
      {required this.productId,
      required this.code,
      required this.description,
      required this.price,
      required this.availableStock,
      required this.pcCommission,
      required this.situation});

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductModelFromJson(json);

  @override
  final String productId;
  @override
  final int code;
  @override
  final String description;
  @override
  final double price;
  @override
  final double availableStock;
  @override
  final double pcCommission;
  @override
  final int situation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductModel(productId: $productId, code: $code, description: $description, price: $price, availableStock: $availableStock, pcCommission: $pcCommission, situation: $situation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductModel'))
      ..add(DiagnosticsProperty('productId', productId))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('availableStock', availableStock))
      ..add(DiagnosticsProperty('pcCommission', pcCommission))
      ..add(DiagnosticsProperty('situation', situation));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductModel &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.availableStock, availableStock) ||
                other.availableStock == availableStock) &&
            (identical(other.pcCommission, pcCommission) ||
                other.pcCommission == pcCommission) &&
            (identical(other.situation, situation) ||
                other.situation == situation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productId, code, description,
      price, availableStock, pcCommission, situation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      __$$_ProductModelCopyWithImpl<_$_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductModelToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
      {required final String productId,
      required final int code,
      required final String description,
      required final double price,
      required final double availableStock,
      required final double pcCommission,
      required final int situation}) = _$_ProductModel;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  String get productId;
  @override
  int get code;
  @override
  String get description;
  @override
  double get price;
  @override
  double get availableStock;
  @override
  double get pcCommission;
  @override
  int get situation;
  @override
  @JsonKey(ignore: true)
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
