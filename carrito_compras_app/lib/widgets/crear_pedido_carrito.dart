import 'package:carrito_compras_app/models/models.dart';
import 'package:carrito_compras_app/theme/theme.dart';
import 'package:carrito_compras_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../db/db.dart';
import '../providers/login_controller.dart';
import 'get_date.dart';
import 'package:get/get.dart';

class CrearPedidoCarrito {
  void callDatepicker(
      BuildContext context, LoginController loginController) async {
    var selectedDate = await getDatePickerWidget(context);
    loginController.fechaPedido.value =
        DateFormat('yyyy-MM-dd').format(selectedDate!);
    DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  void dialogoCrearPedido(BuildContext context) {
    final LoginController loginController = Get.find();

    loginController.fechaPedido.value = "DD/MM/AAAA";

    TextEditingController detalleController = TextEditingController();
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.all(10),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: Container(
                      width: Get.width * 0.85,
                      height: Get.height * 0.50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      padding: EdgeInsets.all(Get.height * 0.025),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(
                            () => CapturarFecha(
                              selectedOption: loginController.fechaPedido.value,
                              onTap: () {
                                callDatepicker(context, loginController);
                              },
                              icon: Icons.calendar_today_outlined,
                              iconColor: AppTheme.primaryAzul,
                              iconSize: Get.height * 0.025,
                            ),
                          ),
                          SizedBox(height: Get.height * 0.015),
                          SizedBox(
                            height: 50,
                            width: Get.width,
                            child: LoginButton(
                                fontSize: 12,
                                text: "Cliente",
                                backgroundColor: AppTheme.primaryAzul,
                                borderColor: AppTheme.primaryAzul,
                                textColor: Colors.white,
                                onPressed: () {}),
                          ),
                          SizedBox(height: Get.height * 0.015),
                          TextoString(
                            onChanged: (valor) {},
                            labelText: "Detalle pedido",
                            textController: detalleController,
                            mensaje: "Ingrese el lote",
                            maxLines: 5,
                          ),
                          SizedBox(height: Get.height * 0.040),
                          SizedBox(
                            height: 50,
                            width: 180,
                            child: LoginButton(
                                fontSize: 12,
                                text: "Aceptar",
                                backgroundColor: AppTheme.primaryAzul,
                                borderColor: AppTheme.primaryAzul,
                                textColor: AppTheme.primaryYellow,
                                onPressed: () async {
                                  if (loginController.comprobarCampos(
                                      detalleController.text)) {
                                    PedidosModel registroPedido = PedidosModel(
                                        date: loginController.fechaPedido.value,
                                        cliente: loginController
                                            .clientePedido.codigo,
                                        descripcion: detalleController.text);
                                    bool registro = await DBProvider.db
                                        .guardarPedido(registroPedido);
                                    if (registro) {
                                      Get.back();
                                      // ignore: use_build_context_synchronously
                                      DialogoProductoAgregado()
                                          .dialogoProductoAgregado(context,
                                              "¡Pedido agregado con éxito!");
                                    }
                                  } else {
                                    DialogoProductoAgregado()
                                        .dialogoProductoAgregado(
                                            context, "Llene todos los campos");
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}
