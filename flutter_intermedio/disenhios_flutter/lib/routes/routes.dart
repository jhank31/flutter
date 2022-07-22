import 'package:disenhios_flutter/pages/animaciones_page.dart';
import 'package:disenhios_flutter/pages/emergency_page.dart';
import 'package:disenhios_flutter/pages/graficas_circulares_page.dart';
import 'package:disenhios_flutter/pages/headers_page.dart';
import 'package:disenhios_flutter/pages/pinterest_page.dart';
import 'package:disenhios_flutter/pages/slider_list.dart';
import 'package:disenhios_flutter/pages/slideshow_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', const SlideShowPage()),
  _Route(FontAwesomeIcons.car, 'Emergencia', const EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', const HeadersPage()),
  _Route(
      FontAwesomeIcons.peopleGroup, 'Cuadro Animado', const CuadraroAnimado()),
  _Route(FontAwesomeIcons.circleNotch, 'Circulo de progreso',
      const GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', const PinterestScreen()),
  _Route(FontAwesomeIcons.mobile, 'Slideshow', const SliderListPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}
