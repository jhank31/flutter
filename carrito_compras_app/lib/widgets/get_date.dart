import 'package:carrito_compras_app/theme/theme.dart';
import 'package:flutter/material.dart';

Future<DateTime?> getDatePickerWidget(context) {
  return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1969, 1, 1),
      lastDate: DateTime(2024),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            dialogBackgroundColor: Colors.white, colorScheme: const ColorScheme.light(
                primary: AppTheme.primaryAzul,
                onSecondary: Colors.black,
                onPrimary: Colors.white,
                surface: Colors.black,
                onSurface: Colors.black,
                secondary: Colors.black).copyWith(secondary: Colors.black),
          ),
          child: child!,
        );
      });
}