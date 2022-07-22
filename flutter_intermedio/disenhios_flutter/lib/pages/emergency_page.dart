import 'package:animate_do/animate_do.dart';
import 'package:disenhios_flutter/widgets/boton_gordo.dart';
import 'package:disenhios_flutter/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards',
          const Color(0xff317183), const Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards',
          const Color(0xff317183), const Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards',
          const Color(0xff317183), const Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
    //esta es la libreria de animaciones de fernando herrera
        .map((item) => FadeInLeft(
              child: BotonGordo(
                icon: item.icon,
                color1: item.color1,
                color2: item.color2,
                onPress: () {},
                text: item.texto,
              ),
            ))
        .toList();

    return Scaffold(
        body: Stack(children: [
      ListView(
        //es para que haga la animaciond el rebote con el scroll
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 250,
          ),
          ...itemMap
        ],
      ),
      const _Encabezado()
    ]));
  }
}

class _Encabezado extends StatelessWidget {
  const _Encabezado({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHeader(
            color1: Color(0xff66A9F2),
            color2: Color(0xff536CF6),
            icon: FontAwesomeIcons.plus,
            titulo: 'Haz solicitado',
            subtitulo: 'Asistencia Medica'),
        Positioned(
            right: -20,
            top: 50,
            child: RawMaterialButton(
              onPressed: () {},
              padding: const EdgeInsets.all(15),
              shape: const CircleBorder(),
              child: const FaIcon(
                FontAwesomeIcons.ellipsisVertical,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      icon: FontAwesomeIcons.carBurst,
      color1: const Color(0xff6989f5),
      color2: const Color(0xff906ef5),
      onPress: () {
        print('click');
      },
      text: 'Motor Accident',
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.circlePlus,
      titulo: 'Haz solicitado',
      subtitulo: 'Asistencia medica',
      color1: Color(0xff526bf6),
      color2: Color(0xff67acf2),
    );
  }
}
