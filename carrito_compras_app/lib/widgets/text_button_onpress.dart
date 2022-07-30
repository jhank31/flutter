import 'package:carrito_compras_app/theme/theme.dart';
import 'package:flutter/material.dart';

class ButtonOnTap extends StatelessWidget {
  const ButtonOnTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 140,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            backgroundColor: AppTheme.primaryAzul,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        child: const Text(
          'Agregar',
          style: TextStyle(color: AppTheme.primaryYellow),
        ),
      ),
    );
  }
}
