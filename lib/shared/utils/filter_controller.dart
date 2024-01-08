import 'dart:async';

import 'package:voleep_carclean_frontend/shared/models/filter.dart';

class FilterController {
  FilterController() : _filterController = StreamController();

  final StreamController<List<Filter>> _filterController;

  List<Filter> _filters = [];

  List<Filter> get filters => List.from(_filters);

  void doFilter(List<Filter> filters) {
    _filters = filters;
    _filterController.add(filters);
  }

  Stream<List<Filter>> onFilter() => _filterController.stream;

  void dispose() {
    _filters = [];
    _filterController.close();
  }
}
