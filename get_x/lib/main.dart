import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_x/pages/home_pages.dart';
import 'package:get_x/pages/splash_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'splash',
      routes: {
        'home': (_) => HomePage(),
        'splash': (_) => const SplashPage(),
      },
    );
  }
}
