import 'package:carrito_compras_app/pages/login_page.dart';
import 'package:carrito_compras_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../providers/login_controller.dart';
import '../theme/theme.dart';

// ignore: must_be_immutable
class AppBarInformationVendedor extends StatelessWidget {
  AppBarInformationVendedor({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.offAll(()=>  LoginPage());
                  },
                  child: Image.asset(
                    "assets/icons/Icono_cerrar_sesion.png",
                    height: 25,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: (){
                    Get.to(()=> const DetalleCarrito());
                  },
                  child: Image.asset(
                    "assets/icons/Icono_carrito_compras.png",
                    height: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,20,0),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: AppTheme.primaryGrey),
                          child: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Image.asset(
                              "assets/icons/Logo_azul.png",
                              height: 30,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Hola, ${loginController.vendedorLogueado.nombre}",
                          style: const TextStyle(
                              color: AppTheme.primaryAzul,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        const Text(
                          "Bienvenido",
                          style: TextStyle(
                              color: AppTheme.primaryGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                "assets/icons/Icono_perfil1.png",
                                height: 30,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "Área",
                                style: TextStyle(
                                    color: AppTheme.primaryGrey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "\$5000",
                                style: TextStyle(
                                    color: AppTheme.primaryGrey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/icons/Icono_perfil2.png",
                                height: 30,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "Saldo",
                                style: TextStyle(
                                    color: AppTheme.primaryGrey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "\$4500",
                                style: TextStyle(
                                    color: AppTheme.primaryGrey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/icons/Icono_perfil3.png",
                                height: 30,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "Perfil",
                                style: TextStyle(
                                    color: AppTheme.primaryGrey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "46",
                                style: TextStyle(
                                    color: AppTheme.primaryGrey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}