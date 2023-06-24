import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedDataRowIndexProvider =
    AutoDisposeStateProviderFamily<int?, Key>((ref, arg) => null);
