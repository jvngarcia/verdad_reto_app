import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';

class _GameMode {
  List<dynamic> options = [];
  String item = '';

  Future<String> loadData(String mode, String option) async {
    final resp = await rootBundle.loadString('data/mode_$mode.json');

    Map dataMap = jsonDecode(resp);

    options = dataMap[option];

    final random = Random();

    item = options[random.nextInt(options.length)];
    return item;
  }
}

final gameMode = _GameMode();
