import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/action_option.dart';

typedef ActionsBuilder<T> = List<ActionOption> Function(
    BuildContext context, int index, T item);
