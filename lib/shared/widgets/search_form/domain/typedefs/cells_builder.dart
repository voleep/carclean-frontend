import 'package:flutter/material.dart';

typedef CellsBuilder<T> = List<Widget> Function(BuildContext context, int index, T item);
