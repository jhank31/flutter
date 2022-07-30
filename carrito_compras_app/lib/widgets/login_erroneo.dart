import 'dart:async';

import 'package:carrito_compras_app/theme/theme.dart';
import 'package:carrito_compras_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WrongUserOrPassword {
  starTimer() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Get.back();
  }

  void showAlert(
      String dialogTitle, BuildContext context, String dialogMessage) {
    starTimer();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.warning_rounded,
                size: 25,
                color: AppTheme.primaryAzul,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                dialogTitle,
                style: const TextStyle(
                    height: 1.8,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
            ],
          ),
          content: Builder(
            builder: (context) {
              final size = MediaQuery.of(context).size;
              return SizedBox(
                height: size.height - 700,
                width: size.width - 100,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dialogMessage,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        height: 50,
                        child: LoginButton(
                            fontSize: 15,
                            text: "Cancelar",
                            backgroundColor: AppTheme.primaryAzul,
                            borderColor: AppTheme.primaryAzul,
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
