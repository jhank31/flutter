import 'package:carrito_compras_app/theme/theme.dart';
import 'package:flutter/material.dart';

class AuthBackGround extends StatelessWidget {
  final Widget child;
  const AuthBackGround({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [const _Backgorund(), child],
      ),
    );
  }
}

class _Backgorund extends StatelessWidget {
  const _Backgorund({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.primaryAzul,
    );
  }
}
