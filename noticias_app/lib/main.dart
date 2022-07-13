import 'package:flutter/material.dart';
import 'package:noticias_app/src/screens/tabs_screen.dart';
import 'package:noticias_app/src/services/news_services.dart';
import 'package:noticias_app/src/theme/tema.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NewsServices())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: miTema,
        home: const TabsScreen(),
      ),
    );
  }
}
