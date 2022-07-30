// ignore_for_file: must_be_immutable

import 'package:carrito_compras_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../providers/login_controller.dart';

class CatalogoCards extends StatelessWidget {
  CatalogoCards({Key? key}) : super(key: key);

  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 4,
        childAspectRatio: 1 / 1.93,
        crossAxisCount: 2,
        crossAxisSpacing: 1,
      ),
      itemCount: loginController.listadoProductos.length,
      itemBuilder: (BuildContext context, int i) {
        return ContainerProcutoCatalogo(
            productoCatalogo: loginController.listadoProductos[i]);
      },
    );
  }
}
