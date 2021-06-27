import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final int _milliseconds;
  final int _seconds;
  Timer? _timer;

  Debouncer({
    int milliseconds = 0,
    int seconds = 0,
  })  : _milliseconds = milliseconds,
        _seconds = seconds;

  run({required VoidCallback action}) {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer =
        Timer(Duration(milliseconds: _milliseconds, seconds: _seconds), action);
  }
}
