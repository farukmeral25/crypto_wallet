import 'package:flutter/services.dart';

class AppFunctions {
  static copy(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }
}
