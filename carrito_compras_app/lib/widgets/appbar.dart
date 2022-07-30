// ignore_for_file: must_be_immutable

import 'package:carrito_compras_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../providers/login_controller.dart';
import '../theme/theme.dart';

class AppBarPersonalizado extends StatelessWidget with PreferredSizeWidget {
  AppBarPersonalizado({Key? key, this.conCarrito = false}) : super(key: key);
  bool? conCarrito;
  LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 24,
                color: AppTheme.primaryAzul,
              ),
            ),
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppTheme.primaryGrey),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: SvgPicture.asset(
                  "assets/svg/Logo_azul.svg",
                  height: 30,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hola, ${loginController.vendedorLogueado.nombre}",
                  style: const TextStyle(
                      color: AppTheme.primaryAzul,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                Transform.translate(
                  offset: const Offset(-30, 0),
                  child: const Text(
                    "Bienvenido",
                    style: TextStyle(
                        color: AppTheme.primaryGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                )
              ],
            ),
            const SizedBox(width: 30),
            conCarrito!
                ? Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const DetalleCarrito());
                      },
                      child: SvgPicture.asset(
                        "assets/svg/Icono_carrito_compras.svg",
                        height: 25,
                      ),
                    ),
                  )
                : const Expanded(child: SizedBox.shrink()),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
