import 'package:carrito_compras_app/theme/theme.dart';
import 'package:carrito_compras_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductosWidgets extends StatelessWidget {
  const ProductosWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarPersonalizado(conCarrito: true),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: SizedBox(
                    height: 30,
                    width: 90,
                    child: LoginButton(
                        fontSize: 12,
                        text: "Catálogo",
                        backgroundColor: AppTheme.primaryAzul,
                        borderColor: AppTheme.primaryAzul,
                        textColor: AppTheme.primaryYellow,
                        onPressed: () {}),
                  ),
                ),
                const SizedBox(height: 15),
                CatalogoCards()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
