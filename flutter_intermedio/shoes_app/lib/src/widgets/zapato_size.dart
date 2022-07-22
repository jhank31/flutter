import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/pages/zapato_desc_page.dart';

import '../models/zapato_model.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool? fullScreen;
  // ignore: use_key_in_widget_constructors
  const ZapatoSizePreview({this.fullScreen});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (fullScreen == false) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const ZapatoDescPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (fullScreen == true) ? 5 : 30,
          vertical: (fullScreen == true) ? 0 : 5,
        ),
        child: Container(
          width: double.infinity,
          height: (fullScreen == true) ? 410 : 430,
          decoration: BoxDecoration(
            color: const Color(0xffffcf53),
            borderRadius: (fullScreen == false)
                ? BorderRadius.circular(50)
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
          ),
          child: Column(
            children: [
              const _ZapatoConSombra(),
              if (fullScreen == false) const _ZapatoTallas(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          const Positioned(right: 0, bottom: 20, child: _ZapatoSombra()),
          Image(image: AssetImage(zapatoModel.assetImage)),
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  const _ZapatoSombra({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(color: Color(0xffeaa14e), blurRadius: 40)
        ], borderRadius: BorderRadius.circular(100)),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  const _ZapatoTallas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _TallasContainer(7),
          _TallasContainer(7.5),
          _TallasContainer(8),
          _TallasContainer(8.5),
          _TallasContainer(9),
          _TallasContainer(9.5),
        ],
      ),
    );
  }
}

class _TallasContainer extends StatelessWidget {
  final double numero;

  const _TallasContainer(
    this.numero,
  );

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return GestureDetector(
      onTap: () {
        zapatoModel.talla = numero;
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: (numero == zapatoModel.talla)
              ? const Color(0xfff1a23a)
              : Colors.white,
          boxShadow: [
            if (numero == zapatoModel.talla)
              const BoxShadow(
                  color: Color(0xfff1a23a),
                  blurRadius: 10,
                  offset: Offset(0, 5))
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        width: 45,
        height: 45,
        child: Text(
          numero.toString().replaceAll('.0', ''),
          style: TextStyle(
              color: (numero == zapatoModel.talla)
                  ? Colors.white
                  : const Color(0xfff1a23a),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
