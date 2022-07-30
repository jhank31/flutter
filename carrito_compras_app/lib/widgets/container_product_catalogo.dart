// ignore_for_file: must_be_immutable, avoid_print

import 'package:carrito_compras_app/models/models.dart';
import 'package:carrito_compras_app/theme/theme.dart';
import 'package:carrito_compras_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../providers/login_controller.dart';

class ContainerProcutoCatalogo extends StatelessWidget {
  ContainerProcutoCatalogo({Key? key, required this.productoCatalogo})
      : super(key: key);
  ProductoCatalogoModel productoCatalogo;
  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    int contador = loginController.getCantidadProducto(productoCatalogo);
    print("contador al entrar $contador");

    return GestureDetector(
      onTap: () {
        Get.to(
            () => DetalleProductosCatalogo(productoCatalogo: productoCatalogo));
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset("assets/imgs/no-image.jpg",
                    height: 130, width: 130, fit: BoxFit.cover),
              ),
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productoCatalogo.nombre!,
                      style: const TextStyle(
                          color: AppTheme.primaryAzul,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(productoCatalogo.codigo!,
                      style: const TextStyle(
                          color: AppTheme.primaryGrey,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text("\$${productoCatalogo.precio!}",
                      style: const TextStyle(
                          color: AppTheme.primaryAzul,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("contador al oprimir botón $contador");
                      contador == 0 ? contador = contador : contador--;
                      print("contador modificado $contador");
                      //llamado a funcion
                      loginController.modificarCarrito(
                          productoCatalogo, contador);
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppTheme.primaryGrey),
                      child: const Icon(Icons.remove),
                    ),
                  ),
                  Obx(
                    () => Text(
                        "${loginController.getCantidadProducto(productoCatalogo)}"),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("contador al oprimir botón $contador");
                      contador++;
                      print("contador modificado $contador");

                      loginController.modificarCarrito(
                          productoCatalogo, contador);
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppTheme.primaryGrey),
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
