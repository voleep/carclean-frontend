// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchConfig {
  String get endpoint => throw _privateConstructorUsedError;
  String get orderField => throw _privateConstructorUsedError;
  bool get filterOnInit => throw _privateConstructorUsedError;
  SelectionType get selectionMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchConfigCopyWith<SearchConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchConfigCopyWith<$Res> {
  factory $SearchConfigCopyWith(
          SearchConfig value, $Res Function(SearchConfig) then) =
      _$SearchConfigCopyWithImpl<$Res, SearchConfig>;
  @useResult
  $Res call(
      {String endpoint,
      String orderField,
      bool filterOnInit,
      SelectionType selectionMode});
}

/// @nodoc
class _$SearchConfigCopyWithImpl<$Res, $Val extends SearchConfig>
    implements $SearchConfigCopyWith<$Res> {
  _$SearchConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpoint = null,
    Object? orderField = null,
    Object? filterOnInit = null,
    Object? selectionMode = null,
  }) {
    return _then(_value.copyWith(
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      orderField: null == orderField
          ? _value.orderField
          : orderField // ignore: cast_nullable_to_non_nullable
              as String,
      filterOnInit: null == filterOnInit
          ? _value.filterOnInit
          : filterOnInit // ignore: cast_nullable_to_non_nullable
              as bool,
      selectionMode: null == selectionMode
          ? _value.selectionMode
          : selectionMode // ignore: cast_nullable_to_non_nullable
              as SelectionType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchConfigCopyWith<$Res>
    implements $SearchConfigCopyWith<$Res> {
  factory _$$_SearchConfigCopyWith(
          _$_SearchConfig value, $Res Function(_$_SearchConfig) then) =
      __$$_SearchConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String endpoint,
      String orderField,
      bool filterOnInit,
      SelectionType selectionMode});
}

/// @nodoc
class __$$_SearchConfigCopyWithImpl<$Res>
    extends _$SearchConfigCopyWithImpl<$Res, _$_SearchConfig>
    implements _$$_SearchConfigCopyWith<$Res> {
  __$$_SearchConfigCopyWithImpl(
      _$_SearchConfig _value, $Res Function(_$_SearchConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpoint = null,
    Object? orderField = null,
    Object? filterOnInit = null,
    Object? selectionMode = null,
  }) {
    return _then(_$_SearchConfig(
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      orderField: null == orderField
          ? _value.orderField
          : orderField // ignore: cast_nullable_to_non_nullable
              as String,
      filterOnInit: null == filterOnInit
          ? _value.filterOnInit
          : filterOnInit // ignore: cast_nullable_to_non_nullable
              as bool,
      selectionMode: null == selectionMode
          ? _value.selectionMode
          : selectionMode // ignore: cast_nullable_to_non_nullable
              as SelectionType,
    ));
  }
}

/// @nodoc

class _$_SearchConfig with DiagnosticableTreeMixin implements _SearchConfig {
  const _$_SearchConfig(
      {required this.endpoint,
      required this.orderField,
      required this.filterOnInit,
      this.selectionMode = SelectionType.none});

  @override
  final String endpoint;
  @override
  final String orderField;
  @override
  final bool filterOnInit;
  @override
  @JsonKey()
  final SelectionType selectionMode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchConfig(endpoint: $endpoint, orderField: $orderField, filterOnInit: $filterOnInit, selectionMode: $selectionMode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchConfig'))
      ..add(DiagnosticsProperty('endpoint', endpoint))
      ..add(DiagnosticsProperty('orderField', orderField))
      ..add(DiagnosticsProperty('filterOnInit', filterOnInit))
      ..add(DiagnosticsProperty('selectionMode', selectionMode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchConfig &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.orderField, orderField) ||
                other.orderField == orderField) &&
            (identical(other.filterOnInit, filterOnInit) ||
                other.filterOnInit == filterOnInit) &&
            (identical(other.selectionMode, selectionMode) ||
                other.selectionMode == selectionMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, endpoint, orderField, filterOnInit, selectionMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchConfigCopyWith<_$_SearchConfig> get copyWith =>
      __$$_SearchConfigCopyWithImpl<_$_SearchConfig>(this, _$identity);
}

abstract class _SearchConfig implements SearchConfig {
  const factory _SearchConfig(
      {required final String endpoint,
      required final String orderField,
      required final bool filterOnInit,
      final SelectionType selectionMode}) = _$_SearchConfig;

  @override
  String get endpoint;
  @override
  String get orderField;
  @override
  bool get filterOnInit;
  @override
  SelectionType get selectionMode;
  @override
  @JsonKey(ignore: true)
  _$$_SearchConfigCopyWith<_$_SearchConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
