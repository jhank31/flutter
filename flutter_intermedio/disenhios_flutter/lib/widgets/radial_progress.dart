import 'dart:math';

import 'package:flutter/material.dart';

class RadiualProgress extends StatefulWidget {
  final Color colorPrimario;
  final double porcentaje;
  final Color colorSecundario;

  // ignore: use_key_in_widget_constructors
  const RadiualProgress(
      {required this.porcentaje,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey});

  @override
  State<RadiualProgress> createState() => _RadiualProgressState();
}

class _RadiualProgressState extends State<RadiualProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
        vsync: this, duration: const Duration(microseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
                painter: _MiRadialProgress(
                    (widget.porcentaje - diferenciaAnimar) +
                        (diferenciaAnimar * controller.value),
                    widget.colorPrimario,
                    widget.colorSecundario)),
          );
        });
  }
}

class _MiRadialProgress extends CustomPainter {
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  _MiRadialProgress(this.porcentaje, this.colorPrimario, this.colorSecundario);
  @override
  void paint(Canvas canvas, Size size) {
    //circulo completado, esto es lo que se usa para crear un circulo
    final paint = Paint()
      ..strokeWidth = 4
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    //arco
    final paintArco = Paint()
      ..strokeWidth = 10
      ..color = colorPrimario
      ..style = PaintingStyle.stroke;

    //parte que se va llenando
    double arcoAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcoAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
