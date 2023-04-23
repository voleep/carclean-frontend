import 'package:flutter/foundation.dart';
import 'dart:async';

class DebounceTime {
  final int milliseconds;
  Timer? _timer;

  DebounceTime({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
