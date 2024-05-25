import 'package:flutter/material.dart';

class FontProvider with ChangeNotifier {
  String _selectedFont = 'Roboto';

  String get selectedFont => _selectedFont;

  void setSelectedFont(String font) {
    _selectedFont = font;
    notifyListeners();
  }
}
