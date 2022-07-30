import 'package:carrito_compras_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets.dart';

class DetalleCarrito extends StatelessWidget {
  const DetalleCarrito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarPersonalizado(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  height: 30,
                  width: 90,
                  child: LoginButton(
                      fontSize: 12,
                      text: "Carrito",
                      backgroundColor: AppTheme.primaryAzul,
                      borderColor: AppTheme.primaryAzul,
                      textColor: AppTheme.primaryYellow,
                      onPressed: () {}),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: SingleChildScrollView(
                  child: GridCarrito(),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 50,
                width: Get.width,
                child: LoginButton(
                    fontSize: 12,
                    text: "Guardar pedido",
                    backgroundColor: AppTheme.primaryAzul,
                    borderColor: AppTheme.primaryAzul,
                    textColor: AppTheme.primaryYellow,
                    onPressed: () {
                      CrearPedidoCarrito().dialogoCrearPedido(context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
