import 'package:carrito_compras_app/theme/theme.dart';
import 'package:carrito_compras_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../providers/login_controller.dart';

// ignore: must_be_immutable
class GridCarrito extends StatelessWidget {
  GridCarrito({Key? key}) : super(key: key);
  LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => loginController.listaProductosCarrito.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                    child: Text("No hay productos en el carrito",
                        style: TextStyle(color: AppTheme.primaryAzul, fontSize: 25))),
              ],
            )
          : Column(
            children: [
              Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: loginController.listaProductosCarrito.length,
                      itemBuilder: (_, index) => DetalleProductoCarrito(
                          productoCatalogo: loginController
                              .listaProductosCarrito.keys
                              .elementAt(index)),
                      separatorBuilder: (_, i) => Divider(
                          height: Get.height * 0.02,
                          thickness: 1,
                          color: AppTheme.primaryGrey),
                    ),
                  ),
                ),
                //SizedBox(height: 15),
                
            ],
          ),
    );
  }
}