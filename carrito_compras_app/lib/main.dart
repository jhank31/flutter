import 'package:carrito_compras_app/pages/pages.dart';
import 'package:carrito_compras_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carrito app',
      initialRoute: 'login',
      theme: AppTheme.myTheme,
      routes: {
        'login': (context) => LoginPage(),
        'productos': (context) => const ProductosWidgets(),
        'home': (context) => HomePage(),
      },
    );
  }
}
