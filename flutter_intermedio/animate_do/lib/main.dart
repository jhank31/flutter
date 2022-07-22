import 'package:animate_do_app/src/screens/pagina1_screen.dart';
/* import 'package:animate_do_app/src/screens/pagina1_screen.dart'; */
/* import 'package:animate_do_app/src/screens/pagina1_screen.dart'; */
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animate do',
      home: Pagina1Screen(),
    );
  }
}
