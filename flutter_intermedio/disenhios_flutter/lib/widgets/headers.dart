import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      color: const Color(0xff615AAB),
    );
  }
}

class BordesRedondeados extends StatelessWidget {
  const BordesRedondeados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xff615AAB),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ));
  }
}
//implementacion del custom painter

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    // propiedades del lapiz
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5.0;

    final path = Path();
    //dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.35);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//header triangulo
class HeaderTriangulo extends StatelessWidget {
  const HeaderTriangulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangulo(),
      ),
    );
  }
}

class _HeaderTriangulo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    // propiedades del lapiz
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5.0;

    final path = Path();
    //dibujar con el path y el lapiz
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//header triangulo invertido
class HeaderTrianguloInvetido extends StatelessWidget {
  const HeaderTrianguloInvetido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTrianguloInvertido(),
      ),
    );
  }
}

class _HeaderTrianguloInvertido extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    // propiedades del lapiz
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5.0;

    final path = Path();
    //dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.30);
    path.lineTo(size.width * 0.50, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// header con curvatura
class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvo(),
      ),
    );
  }
}

class _HeaderCurvo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    // propiedades del lapiz
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5.0;

    final path = Path();
    //dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.30);
    path.quadraticBezierTo(
        //las 2 primeras coordenadas con por donde deveria pasar la linea para que se cree la curvatura
        size.width * 0.50,
        size.height * 0.45,
        size.width,
        size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//header en forma de s

class HeaderCurvaDoble extends StatelessWidget {
  const HeaderCurvaDoble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvaDoble(),
      ),
    );
  }
}

class _HeaderCurvaDoble extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    // propiedades del lapiz
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5.0;

    final path = Path();
    //dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35,
        size.width * 0.50, size.height * 0.30);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.25, size.width, size.height * 0.30);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//footer en forma de s invetida

class HeaderCurvaDobleBottom extends StatelessWidget {
  const HeaderCurvaDobleBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvaDobleBottom(),
      ),
    );
  }
}

class _HeaderCurvaDobleBottom extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    // propiedades del lapiz
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5.0;

    final path = Path();
    //dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.70);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.65,
        size.width * 0.50, size.height * 0.70);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.75, size.width, size.height * 0.70);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// header con forma de s con gradient
class HeaderCurvaDobleGradient extends StatelessWidget {
  const HeaderCurvaDobleGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvaDobleGradient(),
      ),
    );
  }
}

class _HeaderCurvaDobleGradient extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        Rect.fromCircle(center: const Offset(165.0, 55.0), radius: 250);
    //aqui se declara el gradiente
    const Gradient gradiente = LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xff6d05e8),
          Color(0xffc012f5),
          Color(0xff6d05fa),
        ]);
    final lapiz = Paint()..shader = gradiente.createShader(rect);
    // propiedades del lapiz
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5.0;

    final path = Path();
    //dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35,
        size.width * 0.50, size.height * 0.30);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.25, size.width, size.height * 0.30);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color? color1;
  final Color? color2;

  // ignore: use_key_in_widget_constructors
  const IconHeader({
    required this.icon,
    required this.titulo,
    required this.subtitulo,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(0.7);
    return Stack(children: [
      _IconHeaderBackground(color1!, color2!),
      Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            icon,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          )),
      Column(
        children: [
          const SizedBox(
            height: 80,
            width: double.infinity,
          ),
          Text(
            titulo,
            style: TextStyle(fontSize: 20, color: colorBlanco),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            subtitulo,
            style: TextStyle(
                fontSize: 25, color: colorBlanco, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          FaIcon(
            icon,
            size: 75,
            color: Colors.white,
          )
        ],
      )
    ]);
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderBackground(this.color1, this.color2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                color1,
                color2,
              ])),
    );
  }
}
