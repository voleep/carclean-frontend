import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/search_config.dart';

part 'search_multiselection_controller.g.dart';

@riverpod
class SearchMultiSelectionController extends _$SearchMultiSelectionController {
  @override
  List<Object> build(SearchConfig config) {
    return [];
  }

  handleItemClicked(Object selectId) {
    final newState = [...state];
    final isSelected = state.contains(selectId);

    if (isSelected) {
      newState.remove(selectId);
    } else {
      newState.add(selectId);
    }

    state = newState;
  }
}
