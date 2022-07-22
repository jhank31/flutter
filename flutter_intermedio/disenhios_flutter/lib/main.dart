import 'package:disenhios_flutter/pages/launcher_page.dart';
import 'package:disenhios_flutter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (BuildContext context) => ThemeChanger(2), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños app',
      home: const LauncherPage(),
      theme: appTheme.currentTheme,
    );
  }
}
