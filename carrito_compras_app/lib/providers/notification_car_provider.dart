import 'package:flutter/material.dart';

class NotificationCar extends ChangeNotifier {
  int _notifications = 0;

  int get notifications => _notifications;
  set notifications(int value) {
    _notifications = value;
    notifyListeners();
  }

 
}
