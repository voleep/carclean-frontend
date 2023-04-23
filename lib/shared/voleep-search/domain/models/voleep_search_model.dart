import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class VoleepSearchModel<T> extends Equatable {
  final List<T> data;
  final String orderField;
  final int currentPage;
  final int numberOfItems;
  final int numberOfPager;
  final String? searchQuery;

  const VoleepSearchModel({
    required this.data,
    required this.orderField,
    required this.currentPage,
    required this.numberOfItems,
    required this.numberOfPager,
    this.searchQuery,
  });

  VoleepSearchModel<T> copiedWithPage(List<T> data) => VoleepSearchModel<T>(
        data: [...this.data, ...data],
        orderField: orderField,
        searchQuery: searchQuery,
        currentPage: currentPage,
        numberOfItems: numberOfItems,
        numberOfPager: numberOfPager,
      );

  @override
  List<Object?> get props => [
        data,
        orderField,
        searchQuery,
        currentPage,
        numberOfItems,
        numberOfPager,
      ];
}
