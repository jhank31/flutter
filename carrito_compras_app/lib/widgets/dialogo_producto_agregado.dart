import 'package:carrito_compras_app/theme/theme.dart';
import 'package:carrito_compras_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogoProductoAgregado {
  void dialogoProductoAgregado(BuildContext contextInicial, String mensaje) {
    double textScale = Get.textScaleFactor;

    showDialog(
        barrierDismissible: false,
        context: contextInicial,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(10),
            child: Container(
              width: Get.width * 0.85,
              height: Get.height * 0.20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Text(mensaje,
                            style: TextStyle(
                                fontSize: Get.height * 0.024 / textScale,
                                color: AppTheme.primaryAzul),
                            textAlign: TextAlign.center)),
                    SizedBox(height: Get.height * 0.02),
                    SizedBox(
                      height: 50,
                      width: 180,
                      child: LoginButton(
                          fontSize: 12,
                          text: "Aceptar",
                          backgroundColor: AppTheme.primaryAzul,
                          borderColor: AppTheme.primaryAzul,
                          textColor: AppTheme.primaryYellow,
                          onPressed: () {
                            Get.back();
                          }),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
