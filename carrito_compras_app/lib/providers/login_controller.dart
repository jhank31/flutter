// ignore_for_file: avoid_print

import 'package:carrito_compras_app/db/db.dart';
import 'package:carrito_compras_app/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../widgets/widgets.dart';

class LoginController extends GetxController {
  RxString usuario = ''.obs;
  RxString password = ''.obs;
  RxBool obscurePassword = true.obs;
  RxString fechaPedido = 'DD/MM/AAAA'.obs;

  late UsuarioModel usuarioLogueado;
  late VendedorModel vendedorLogueado;
  List<ClienteModel> listadoClientes = [];
  List<ProductoCatalogoModel> listadoProductos = [];
  ClienteModel clientePedido = ClienteModel();
  RxMap<ProductoCatalogoModel, int> listaProductosCarrito = RxMap();

  //obtener usuario logueado
  @override
  void onInit() async {
    super.onInit();
    usuarioLogueado = await DBProvider.db.getUsuario();
    vendedorLogueado = await DBProvider.db.getVendedor();
    listadoClientes = await DBProvider.db.getClientes(vendedorLogueado);
    listadoProductos = await DBProvider.db.obtenerProductosCatalogo();
    await DBProvider.db.crearTablaRegistroPedidos();
  }

  validateUser(BuildContext context) async {
    if (usuario.value == '' && password.value == '') {
      WrongUserOrPassword().showAlert('No se leyo data', context,
          'Por favor ingrese un usuario y una contreña');
    } else if (usuario.value != usuarioLogueado.usuario &&
        password.value != usuarioLogueado.password) {
      WrongUserOrPassword().showAlert(
          "Datos incorrectos", context, "Usuario o contraseña incorrectos");
    } else if (usuario.value == usuarioLogueado.usuario &&
        password.value == usuarioLogueado.password) {
      vendedorLogueado = await DBProvider.db.getVendedor();
      listadoClientes = await DBProvider.db.getClientes(vendedorLogueado);
      listadoProductos = await DBProvider.db.obtenerProductosCatalogo();
      await DBProvider.db.crearTablaRegistroPedidos();
      print('usuario validado');
    }
  }

  void modificarCarrito(ProductoCatalogoModel productoCatalogo, int cantidad) {
    listaProductosCarrito.putIfAbsent(productoCatalogo, () => cantidad);
    if (productoAgregadoCarrito(productoCatalogo.codigo!)) {
      listaProductosCarrito.update(productoCatalogo, (value) => cantidad);
    }

    if (cantidad == 0) {
      listaProductosCarrito.remove(productoCatalogo);
    }
  }

  //verificar si el producto ya se agrego al carrito
  bool productoAgregadoCarrito(String codigoProducto) {
    bool encontrado = false;
    for (var productoCatalogo in listaProductosCarrito.entries) {
      if (productoCatalogo.key.codigo! == codigoProducto) {
        encontrado = true;
      }
    }

    return encontrado;
  }

  int getCantidadProducto(ProductoCatalogoModel productoCatalogo) {
    if (listaProductosCarrito.containsKey(productoCatalogo)) {
      return listaProductosCarrito[productoCatalogo]!;
    }
    return 0;
  }

  int getPrecio(ProductoCatalogoModel productoCatalogo) {
    int precio = 0;
    for (var producto in listaProductosCarrito.entries) {
      if (producto.key.codigo == productoCatalogo.codigo) {
        precio = producto.value.toInt() * producto.key.precio!.toInt();
      }
    }
    return precio;
  }

  void asignarClientePedido(ClienteModel clienteEnviado) {
    clientePedido = clienteEnviado;
  }

  bool comprobarCampos(String detallePedido) {
    if (fechaPedido.value != "DD/MM/AAAA" && detallePedido != "") return true;
    return false;
  }
}
