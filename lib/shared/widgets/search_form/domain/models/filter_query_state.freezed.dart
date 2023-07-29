// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_query_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterQueryState {
  String get title => throw _privateConstructorUsedError;
  String get field => throw _privateConstructorUsedError;
  FilterCondition get operator => throw _privateConstructorUsedError;
  String get valueLabel => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;
  dynamic get finalValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterQueryStateCopyWith<FilterQueryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterQueryStateCopyWith<$Res> {
  factory $FilterQueryStateCopyWith(
          FilterQueryState value, $Res Function(FilterQueryState) then) =
      _$FilterQueryStateCopyWithImpl<$Res, FilterQueryState>;
  @useResult
  $Res call(
      {String title,
      String field,
      FilterCondition operator,
      String valueLabel,
      dynamic value,
      dynamic finalValue});
}

/// @nodoc
class _$FilterQueryStateCopyWithImpl<$Res, $Val extends FilterQueryState>
    implements $FilterQueryStateCopyWith<$Res> {
  _$FilterQueryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? field = null,
    Object? operator = null,
    Object? valueLabel = null,
    Object? value = freezed,
    Object? finalValue = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as FilterCondition,
      valueLabel: null == valueLabel
          ? _value.valueLabel
          : valueLabel // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      finalValue: freezed == finalValue
          ? _value.finalValue
          : finalValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterQueryStateCopyWith<$Res>
    implements $FilterQueryStateCopyWith<$Res> {
  factory _$$_FilterQueryStateCopyWith(
          _$_FilterQueryState value, $Res Function(_$_FilterQueryState) then) =
      __$$_FilterQueryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String field,
      FilterCondition operator,
      String valueLabel,
      dynamic value,
      dynamic finalValue});
}

/// @nodoc
class __$$_FilterQueryStateCopyWithImpl<$Res>
    extends _$FilterQueryStateCopyWithImpl<$Res, _$_FilterQueryState>
    implements _$$_FilterQueryStateCopyWith<$Res> {
  __$$_FilterQueryStateCopyWithImpl(
      _$_FilterQueryState _value, $Res Function(_$_FilterQueryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? field = null,
    Object? operator = null,
    Object? valueLabel = null,
    Object? value = freezed,
    Object? finalValue = freezed,
  }) {
    return _then(_$_FilterQueryState(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as FilterCondition,
      valueLabel: null == valueLabel
          ? _value.valueLabel
          : valueLabel // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      finalValue: freezed == finalValue
          ? _value.finalValue
          : finalValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_FilterQueryState extends _FilterQueryState {
  const _$_FilterQueryState(
      {required this.title,
      required this.field,
      required this.operator,
      required this.valueLabel,
      required this.value,
      this.finalValue})
      : super._();

  @override
  final String title;
  @override
  final String field;
  @override
  final FilterCondition operator;
  @override
  final String valueLabel;
  @override
  final dynamic value;
  @override
  final dynamic finalValue;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterQueryState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.operator, operator) ||
                other.operator == operator) &&
            (identical(other.valueLabel, valueLabel) ||
                other.valueLabel == valueLabel) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality()
                .equals(other.finalValue, finalValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      field,
      operator,
      valueLabel,
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(finalValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterQueryStateCopyWith<_$_FilterQueryState> get copyWith =>
      __$$_FilterQueryStateCopyWithImpl<_$_FilterQueryState>(this, _$identity);
}

abstract class _FilterQueryState extends FilterQueryState {
  const factory _FilterQueryState(
      {required final String title,
      required final String field,
      required final FilterCondition operator,
      required final String valueLabel,
      required final dynamic value,
      final dynamic finalValue}) = _$_FilterQueryState;
  const _FilterQueryState._() : super._();

  @override
  String get title;
  @override
  String get field;
  @override
  FilterCondition get operator;
  @override
  String get valueLabel;
  @override
  dynamic get value;
  @override
  dynamic get finalValue;
  @override
  @JsonKey(ignore: true)
  _$$_FilterQueryStateCopyWith<_$_FilterQueryState> get copyWith =>
      throw _privateConstructorUsedError;
}
