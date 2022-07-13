import 'package:flutter/material.dart';

class NotificationsService {
  static late GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String meesage) {
    const snackbar = SnackBar(
        content: Text(
      'El correo y la contraseña no son validos',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white, fontSize: 15, overflow: TextOverflow.ellipsis),
    ));

    messengerKey.currentState!.showSnackBar(snackbar);
  }
}
