import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/search_config.dart';

part 'search_multiselection_controller.g.dart';

@riverpod
class SearchMultiSelectionController extends _$SearchMultiSelectionController {
  @override
  List<dynamic> build(SearchConfig config) {
    return [];
  }

  handleItemClicked(dynamic item) {
    final newState = [...state];
    final isSelected = state.contains(item);

    if (isSelected) {
      newState.remove(item);
    } else {
      newState.add(item);
    }

    state = newState;
  }
}
