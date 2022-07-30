// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:carrito_compras_app/pages/home_page.dart';
import 'package:carrito_compras_app/providers/login_controller.dart';
import 'package:carrito_compras_app/theme/theme.dart';
import 'package:carrito_compras_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus && focus.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppTheme.primaryAzul,
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Spacer(),
                    const SizedBox(height: 200),
                    Image.asset('assets/icons/Logo.png'),

                    const SizedBox(height: 40),
                    LoginInput(
                      hintText: "Usuario",
                      image: 'assets/icons/Icono_usuario.png',
                      onChanged: (input) {
                        loginController.usuario(input);
                      },
                      isASensitiveField: false,
                    ),
                    const SizedBox(height: 10),
                    LoginInput(
                      hintText: "Contraseña",
                      image: 'assets/icons/Icono_contraseña.png',
                      onChanged: (input) {
                        loginController.password(input);
                      },
                      isASensitiveField: true,
                    ),
                    const SizedBox(height: 10),
                    Transform.translate(
                      offset: const Offset(-22, 0),
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "¿Olvidaste tu contraseña?",
                          style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                              decorationThickness: 3,
                              color: AppTheme.primaryGrey,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        height: 50,
                        child: LoginButton(
                            fontSize: 18,
                            text: "Iniciar Sesión",
                            backgroundColor: Colors.white,
                            borderColor: Colors.white,
                            textColor: AppTheme.primaryAzul,
                            onPressed: () {
                              loginController.validateUser(context);
                              Get.off(() => HomePage());
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
