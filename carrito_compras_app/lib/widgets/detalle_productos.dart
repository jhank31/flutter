// ignore_for_file: avoid_print

import 'package:carrito_compras_app/models/models.dart';
import 'package:carrito_compras_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../providers/login_controller.dart';
import 'widgets.dart';

// ignore: must_be_immutable
class DetalleProductosCatalogo extends StatelessWidget {
  DetalleProductosCatalogo({Key? key, required this.productoCatalogo})
      : super(key: key);

  ProductoCatalogoModel productoCatalogo;
  LoginController loginController = Get.find();

  // RxInt contador = 0.obs;

  @override
  Widget build(BuildContext context) {
    int contador = loginController.getCantidadProducto(productoCatalogo);
    print("contador al entrar $contador");
    return SafeArea(
      child: Scaffold(
        appBar: AppBarPersonalizado(conCarrito: false),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  height: 30,
                  width: 140,
                  child: LoginButton(
                      fontSize: 12,
                      text: "Detalle Producto",
                      backgroundColor: AppTheme.primaryAzul,
                      borderColor: AppTheme.primaryAzul,
                      textColor: AppTheme.primaryYellow,
                      onPressed: () {}),
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 300,
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
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
                          // SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: Text("Detalle",
                    style: TextStyle(
                        color: AppTheme.primaryAzul,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 300,
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Anim do cupidatat velit ex occaecat do Lorem. Non voluptate dolore ut ad minim veniam culpa culpa Lorem esse deserunt duis cillum veniam. Ex id anim adipisicing consequat et ex eu et dolore. Et duis consequat veniam incididunt ex voluptate cillum occaecat cupidatat. Ad id amet aliquip aliquip deserunt voluptate ea nulla tempor proident labore quis nulla aliquip. Aliqua quis deserunt ex labore incididunt ad pariatur elit tempor mollit ea. Fugiat esse fugiat amet Lorem enim reprehenderit officia amet elit non nostrud.',
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppTheme.primaryGrey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("contador al oprimir botón $contador");
                      contador == 0 ? contador = contador : contador--;
                      print("contador modificado $contador");
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
                  SizedBox(
                    height: 50,
                    width: 140,
                    child: LoginButton(
                        fontSize: 12,
                        text: "Agregar",
                        backgroundColor: AppTheme.primaryAzul,
                        borderColor: AppTheme.primaryAzul,
                        textColor: AppTheme.primaryYellow,
                        onPressed: () {
                          loginController.modificarCarrito(
                              productoCatalogo, contador);
                          DialogoProductoAgregado().dialogoProductoAgregado(
                              context, "Producto agregado al carrito!");
                          //DialogoCrearPedido().dialogoCrearPedido(context);
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
