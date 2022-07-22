import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final bool ubicacionPuntoss;
  final List<Widget> slides;
  final Color colorPriario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  const Slideshow(
      {Key? key,
      required this.slides,
      this.ubicacionPuntoss = false,
      this.colorPriario = Colors.blue,
      this.colorSecundario = Colors.grey,
      this.bulletPrimario = 12.0,
      this.bulletSecundario = 12.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _SlideShowModel(
            colorPriario, colorSecundario, bulletPrimario, bulletSecundario),
        child: SafeArea(
          child: Center(
              child: _CrearEstructuraSlideshow(
                  ubicacionPuntoss: ubicacionPuntoss, slides: slides)),
        ));
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    Key? key,
    required this.ubicacionPuntoss,
    required this.slides,
  }) : super(key: key);

  final bool ubicacionPuntoss;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (ubicacionPuntoss) _Dots(slides.length),
        Expanded(child: _Slides(slides)),
        if (!ubicacionPuntoss) _Dots(slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  const _Dots(
    this.totalSlides,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //esta parte genera los puntos dependiendo de las slid
          children: List.generate(totalSlides, (index) => _Dot(index))),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final slideShowModel = Provider.of<_SlideShowModel>(context);
    double tamano;
    Color color;
    // la condicino que se usa es para que la transicion de los circulos sea mas natural
    if (slideShowModel.currentPage >= index - 0.5 &&
        slideShowModel.currentPage < index + 0.5) {
      tamano = slideShowModel.bulletPrimario;
      color = slideShowModel.colorPrimario;
    } else {
      tamano = slideShowModel.bulletSecundario;
      color = slideShowModel.colorSecundario;
    }

    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      width: tamano,
      height: tamano,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      duration: const Duration(milliseconds: 200),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideShowModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: PageView(
        controller: pageViewController,
        // de esta manera se creacn los widgets de los slides que se necesitan
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

//este es el modelo privado para los dots
class _SlideShowModel extends ChangeNotifier {
  double _currentPage = 0;
  double _bulletPrimario = 0;
  double _bulletSecundario = 0;
  Color _colorPrimario;
  Color _colorSecundario;

  _SlideShowModel(this._colorPrimario, this._colorSecundario,
      this._bulletPrimario, this._bulletSecundario);

  double get currentPage => _currentPage;
  set currentPage(double value) {
    _currentPage = value;
    notifyListeners();
  }

  Color get colorPrimario => _colorPrimario;
  set colorPrimario(Color color) {
    _colorPrimario = color;
    notifyListeners();
  }

  Color get colorSecundario => _colorSecundario;
  set colorSecundario(Color color) {
    _colorSecundario = color;
    notifyListeners();
  }

  double get bulletPrimario => _bulletPrimario;
  set bulletPrimario(double value) {
    _bulletPrimario = value;
    notifyListeners();
  }

  double get bulletSecundario => _bulletSecundario;
  set bulletSecunadario(double value) {
    _bulletSecundario = value;
    notifyListeners();
  }
}
