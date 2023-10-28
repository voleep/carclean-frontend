// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaginationModel<T> {
  int get numberOfItems => throw _privateConstructorUsedError;
  int get numberOfPages => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  List<T> get pageData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationModelCopyWith<T, PaginationModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationModelCopyWith<T, $Res> {
  factory $PaginationModelCopyWith(
          PaginationModel<T> value, $Res Function(PaginationModel<T>) then) =
      _$PaginationModelCopyWithImpl<T, $Res, PaginationModel<T>>;
  @useResult
  $Res call(
      {int numberOfItems,
      int numberOfPages,
      int currentPage,
      List<T> pageData});
}

/// @nodoc
class _$PaginationModelCopyWithImpl<T, $Res, $Val extends PaginationModel<T>>
    implements $PaginationModelCopyWith<T, $Res> {
  _$PaginationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberOfItems = null,
    Object? numberOfPages = null,
    Object? currentPage = null,
    Object? pageData = null,
  }) {
    return _then(_value.copyWith(
      numberOfItems: null == numberOfItems
          ? _value.numberOfItems
          : numberOfItems // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfPages: null == numberOfPages
          ? _value.numberOfPages
          : numberOfPages // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      pageData: null == pageData
          ? _value.pageData
          : pageData // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginationModelCopyWith<T, $Res>
    implements $PaginationModelCopyWith<T, $Res> {
  factory _$$_PaginationModelCopyWith(_$_PaginationModel<T> value,
          $Res Function(_$_PaginationModel<T>) then) =
      __$$_PaginationModelCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {int numberOfItems,
      int numberOfPages,
      int currentPage,
      List<T> pageData});
}

/// @nodoc
class __$$_PaginationModelCopyWithImpl<T, $Res>
    extends _$PaginationModelCopyWithImpl<T, $Res, _$_PaginationModel<T>>
    implements _$$_PaginationModelCopyWith<T, $Res> {
  __$$_PaginationModelCopyWithImpl(
      _$_PaginationModel<T> _value, $Res Function(_$_PaginationModel<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberOfItems = null,
    Object? numberOfPages = null,
    Object? currentPage = null,
    Object? pageData = null,
  }) {
    return _then(_$_PaginationModel<T>(
      numberOfItems: null == numberOfItems
          ? _value.numberOfItems
          : numberOfItems // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfPages: null == numberOfPages
          ? _value.numberOfPages
          : numberOfPages // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      pageData: null == pageData
          ? _value._pageData
          : pageData // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$_PaginationModel<T> extends _PaginationModel<T>
    with DiagnosticableTreeMixin {
  const _$_PaginationModel(
      {required this.numberOfItems,
      required this.numberOfPages,
      required this.currentPage,
      required final List<T> pageData})
      : _pageData = pageData,
        super._();

  @override
  final int numberOfItems;
  @override
  final int numberOfPages;
  @override
  final int currentPage;
  final List<T> _pageData;
  @override
  List<T> get pageData {
    if (_pageData is EqualUnmodifiableListView) return _pageData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pageData);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaginationModel<$T>(numberOfItems: $numberOfItems, numberOfPages: $numberOfPages, currentPage: $currentPage, pageData: $pageData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaginationModel<$T>'))
      ..add(DiagnosticsProperty('numberOfItems', numberOfItems))
      ..add(DiagnosticsProperty('numberOfPages', numberOfPages))
      ..add(DiagnosticsProperty('currentPage', currentPage))
      ..add(DiagnosticsProperty('pageData', pageData));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationModel<T> &&
            (identical(other.numberOfItems, numberOfItems) ||
                other.numberOfItems == numberOfItems) &&
            (identical(other.numberOfPages, numberOfPages) ||
                other.numberOfPages == numberOfPages) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other._pageData, _pageData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, numberOfItems, numberOfPages,
      currentPage, const DeepCollectionEquality().hash(_pageData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationModelCopyWith<T, _$_PaginationModel<T>> get copyWith =>
      __$$_PaginationModelCopyWithImpl<T, _$_PaginationModel<T>>(
          this, _$identity);
}

abstract class _PaginationModel<T> extends PaginationModel<T> {
  const factory _PaginationModel(
      {required final int numberOfItems,
      required final int numberOfPages,
      required final int currentPage,
      required final List<T> pageData}) = _$_PaginationModel<T>;
  const _PaginationModel._() : super._();

  @override
  int get numberOfItems;
  @override
  int get numberOfPages;
  @override
  int get currentPage;
  @override
  List<T> get pageData;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationModelCopyWith<T, _$_PaginationModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
