import 'package:fl_components/models/models_export.dart';
import 'package:flutter/material.dart';

import '../screens/screens_export.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOptions>[
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
        icon: Icons.credit_card),
    MenuOptions(
        route: 'avatar',
        name: 'Circle Avatar',
        screen: const AvatarScreen(),
        icon: Icons.supervised_user_circle_outlined),
    MenuOptions(
        route: 'animated',
        name: 'Animated Container',
        screen: const AnimatedScreen(),
        icon: Icons.play_circle_outline_outlined),
    MenuOptions(
        route: 'inputs',
        name: 'Texts inputs',
        screen: const InputScreen(),
        icon: Icons.input_outlined),
    MenuOptions(
        route: 'Slides',
        name: 'Sliders && checks',
        screen: const SliderScreen(),
        icon: Icons.slow_motion_video_outlined),
    MenuOptions(
        route: 'LisViewBuilder',
        name: 'InfiniteScrol & Pull to refresh',
        screen: const ListViewBuilderScreen(),
        icon: Icons.build_circle_outlined),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

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
