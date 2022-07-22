import 'package:flutter/material.dart';

class ZapatoModel extends ChangeNotifier {
  String _assetImage = 'assets/imgs/azul.png';
  double _talla = 9.0;
  int _id = 0;

  String get assetImage => _assetImage;
  double get talla => _talla;
  int get id => _id;

  set assetImage(String value) {
    _assetImage = value;
    notifyListeners();
  }

  set talla(double value) {
    _talla = value;
    notifyListeners();
  }

  set id(int value) {
    _id = value;
    notifyListeners();
  }
}
