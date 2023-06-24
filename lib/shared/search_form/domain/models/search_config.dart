import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class SearchConfig extends Equatable {
  final String endpoint;
  final String orderField;
  final bool filterOnInit;

  const SearchConfig({required this.endpoint, required this.orderField, required this.filterOnInit});

  @override
  List<Object?> get props => [endpoint, orderField, filterOnInit];
}
