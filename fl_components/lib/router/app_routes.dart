import 'package:fl_components/models/models_export.dart';
import 'package:flutter/material.dart';

import '../screens/screens_export.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOptions>[
    MenuOptions(
        route: 'home',
        name: 'home screen',
        screen: const HomeScreen(),
        icon: Icons.home_filled),
    MenuOptions(
        route: 'listview1',
        name: 'listview 1',
        screen: const Listview1Screen(),
        icon: Icons.list_rounded),
    MenuOptions(
        route: 'listview2',
        name: 'listview 2',
        screen: const Listview2Screen(),
        icon: Icons.list_alt),
    MenuOptions(
        route: 'alert',
        name: 'alertas',
        screen: const AlertScreen(),
        icon: Icons.add_alert_outlined),
    MenuOptions(
        route: 'card',
        name: 'tarjetas',
        screen: const CardScreen(),
        icon: Icons.credit_card)
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
