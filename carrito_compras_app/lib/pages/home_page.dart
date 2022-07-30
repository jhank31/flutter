// ignore_for_file: must_be_immutable

import 'package:carrito_compras_app/models/models.dart';
import 'package:carrito_compras_app/pages/pages.dart';
import 'package:carrito_compras_app/theme/theme.dart';
import 'package:carrito_compras_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../providers/login_controller.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.background,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarInformationVendedor(),
                  const _ClientesButton(),
                  _ListaCLientes(),
                ],
              ),
            ),
          ),
        ));
  }
}

class _ClientesButton extends StatelessWidget {
  const _ClientesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 30, left: 12, bottom: 15),
      width: 100,
      height: 35,
      decoration: BoxDecoration(
          color: AppTheme.primaryAzul, borderRadius: BorderRadius.circular(25)),
      child: const Text(
        'Clientes',
        style: TextStyle(
            color: AppTheme.primaryYellow, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _ListaCLientes extends StatelessWidget {
  _ListaCLientes({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: loginController.listadoClientes.length,
      itemBuilder: (_, index) =>
          _ListaDetalleCliente(cliente: loginController.listadoClientes[index]),
      separatorBuilder: (_, i) => SizedBox(height: Get.height * 0.01),
    );
  }
}

class _ListaDetalleCliente extends StatelessWidget {
  _ListaDetalleCliente({
    Key? key,
    required this.cliente,
  }) : super(key: key);
  LoginController loginController = Get.put(LoginController());
  ClienteModel cliente;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const ProductosWidgets());
        loginController.asignarClientePedido(cliente);
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(cliente.nombre!,
                style: const TextStyle(
                    color: AppTheme.primaryAzul, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text("NIT: ${cliente.nit!}",
                style: const TextStyle(
                    color: AppTheme.primaryGrey, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text("Ciudad: ${cliente.ciudad!}",
                style: const TextStyle(
                    color: AppTheme.primaryGrey, fontWeight: FontWeight.bold)),
          ]),
        ),
      ),
    );
  }
}
