// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterOption {
  String get title => throw _privateConstructorUsedError;
  String get field => throw _privateConstructorUsedError;
  FilterType get type => throw _privateConstructorUsedError;
  List<EnumOption>? get enumOptions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterOptionCopyWith<FilterOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterOptionCopyWith<$Res> {
  factory $FilterOptionCopyWith(
          FilterOption value, $Res Function(FilterOption) then) =
      _$FilterOptionCopyWithImpl<$Res, FilterOption>;
  @useResult
  $Res call(
      {String title,
      String field,
      FilterType type,
      List<EnumOption>? enumOptions});
}

/// @nodoc
class _$FilterOptionCopyWithImpl<$Res, $Val extends FilterOption>
    implements $FilterOptionCopyWith<$Res> {
  _$FilterOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? field = null,
    Object? type = null,
    Object? enumOptions = freezed,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FilterType,
      enumOptions: freezed == enumOptions
          ? _value.enumOptions
          : enumOptions // ignore: cast_nullable_to_non_nullable
              as List<EnumOption>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterOptionCopyWith<$Res>
    implements $FilterOptionCopyWith<$Res> {
  factory _$$_FilterOptionCopyWith(
          _$_FilterOption value, $Res Function(_$_FilterOption) then) =
      __$$_FilterOptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String field,
      FilterType type,
      List<EnumOption>? enumOptions});
}

/// @nodoc
class __$$_FilterOptionCopyWithImpl<$Res>
    extends _$FilterOptionCopyWithImpl<$Res, _$_FilterOption>
    implements _$$_FilterOptionCopyWith<$Res> {
  __$$_FilterOptionCopyWithImpl(
      _$_FilterOption _value, $Res Function(_$_FilterOption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? field = null,
    Object? type = null,
    Object? enumOptions = freezed,
  }) {
    return _then(_$_FilterOption(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FilterType,
      enumOptions: freezed == enumOptions
          ? _value._enumOptions
          : enumOptions // ignore: cast_nullable_to_non_nullable
              as List<EnumOption>?,
    ));
  }
}

/// @nodoc

class _$_FilterOption with DiagnosticableTreeMixin implements _FilterOption {
  const _$_FilterOption(
      {required this.title,
      required this.field,
      required this.type,
      final List<EnumOption>? enumOptions})
      : _enumOptions = enumOptions;

  @override
  final String title;
  @override
  final String field;
  @override
  final FilterType type;
  final List<EnumOption>? _enumOptions;
  @override
  List<EnumOption>? get enumOptions {
    final value = _enumOptions;
    if (value == null) return null;
    if (_enumOptions is EqualUnmodifiableListView) return _enumOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FilterOption(title: $title, field: $field, type: $type, enumOptions: $enumOptions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FilterOption'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('field', field))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('enumOptions', enumOptions));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterOption &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._enumOptions, _enumOptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, field, type,
      const DeepCollectionEquality().hash(_enumOptions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterOptionCopyWith<_$_FilterOption> get copyWith =>
      __$$_FilterOptionCopyWithImpl<_$_FilterOption>(this, _$identity);
}

abstract class _FilterOption implements FilterOption {
  const factory _FilterOption(
      {required final String title,
      required final String field,
      required final FilterType type,
      final List<EnumOption>? enumOptions}) = _$_FilterOption;

  @override
  String get title;
  @override
  String get field;
  @override
  FilterType get type;
  @override
  List<EnumOption>? get enumOptions;
  @override
  @JsonKey(ignore: true)
  _$$_FilterOptionCopyWith<_$_FilterOption> get copyWith =>
      throw _privateConstructorUsedError;
}
