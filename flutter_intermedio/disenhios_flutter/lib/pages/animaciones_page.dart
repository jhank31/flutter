import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CuadraroAnimado());
  }
}

class CuadraroAnimado extends StatefulWidget {
  const CuadraroAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<CuadraroAnimado> createState() => _CuadraroAnimadoState();
}

class _CuadraroAnimadoState extends State<CuadraroAnimado>
    with SingleTickerProviderStateMixin {
  //AnimatinoControlles es un control para manejar la animacion
  late AnimationController controller;
  //permite controlar los valores de la rotacion
  late Animation<double> rotacion;
  late Animation<double> mover;
  late Animation<double> agrandar;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));
    rotacion = Tween(begin: 0.0, end: 2.0 * Math.pi).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutQuart));
    super.initState();
    mover = Tween(begin: 0.0, end: 200.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutQuart));
    agrandar = Tween(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutQuart));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed &&
          controller.status == AnimationStatus.completed) {
        controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //play o botton de reproduccion
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          //aca es para mover el cuadro en x o y

          offset: Offset(mover.value, 0),
          child: Transform.rotate(
              angle: rotacion.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: const _Rectangulo(),
              )),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  const _Rectangulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
