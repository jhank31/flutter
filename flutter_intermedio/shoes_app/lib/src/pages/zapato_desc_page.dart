import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/widgets/widgets.dart';

import '../helpers/helpers.dart';
import '../models/zapato_model.dart';

class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusLigth();
    return Scaffold(
        body: Column(
      children: [
        Stack(children: [
          const Hero(
              tag: 'zapato-1', child: ZapatoSizePreview(fullScreen: true)),
          Positioned(
              top: 70,
              child: FloatingActionButton(
                highlightElevation: 0,
                backgroundColor: Colors.transparent,
                onPressed: () {
                  cambiarStatusDark();
                  Navigator.pop(context);
                },
                elevation: 0,
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 60,
                ),
              ))
        ]),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: const [
              ZapatoDescripcion(
                titulo: 'Nike Air Max 720',
                descripcion:
                    "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
              ),
              SizedBox(
                height: 25,
              ),
              _MontoCompra(
                monto: 180.0,
              ),
              SizedBox(
                height: 15,
              ),
              _ColoresYmas(),
              SizedBox(
                height: 15,
              ),
              _BotonesInferiores(),
            ],
          ),
        ))
      ],
    ));
  }
}

class _MontoCompra extends StatelessWidget {
  final double monto;
  const _MontoCompra({required this.monto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$$monto',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Bounce(
            from: 8,
            delay: const Duration(seconds: 1),
            child: const BotonNaranjaAlargado(
              alto: 35,
              ancho: 130,
              color: Color(0xfff1a23a),
              texto: 'Buy now',
            ),
          )
        ],
      ),
    );
  }
}

class _ColoresYmas extends StatelessWidget {
  const _ColoresYmas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: const [
                Positioned(
                    left: 90,
                    child: _BotonColor(
                        Color(0xff364d56), 4, 'assets/imgs/negro.png')),
                Positioned(
                    left: 60,
                    child: _BotonColor(
                        Color(0xff2099f1), 3, 'assets/imgs/azul.png')),
                Positioned(
                    left: 30,
                    child: _BotonColor(
                        Color(0xffffad29), 2, 'assets/imgs/amarillo.png')),
                _BotonColor(Color(0xffc6d642), 1, 'assets/imgs/verde.png'),
              ],
            ),
          ),
          const BotonNaranjaAlargado(
            texto: 'More reload items',
            alto: 30,
            ancho: 170,
            color: Color(0xffffc675),
          )
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final String urlImage;
  final int index;
  final Color color;

  const _BotonColor(this.color, this.index, this.urlImage);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 200),
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = urlImage;
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class BotonNaranjaAlargado extends StatelessWidget {
  final Color? color;
  final double? alto;
  final double? ancho;
  final String texto;
  // ignore: use_key_in_widget_constructors
  const BotonNaranjaAlargado(
      {this.color, this.alto, this.ancho, required this.texto});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: alto,
      width: ancho,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        child: Text(
          texto,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _BotonesInferiores extends StatelessWidget {
  const _BotonesInferiores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            _BotonIndividualInferior(Icons.star, 0),
            _BotonIndividualInferior(Icons.add_shopping_cart, 1),
            _BotonIndividualInferior(Icons.settings, 2),
          ]),
    );
  }
}

class _BotonIndividualInferior extends StatelessWidget {
  final int id;
  final IconData icon;

  const _BotonIndividualInferior(this.icon, this.id);

  @override
  Widget build(BuildContext context) {
    final zapatosModel = Provider.of<ZapatoModel>(context);
    return GestureDetector(
      onTap: () {
        zapatosModel.id = id;
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10),
              )
            ]),
        child: (id == zapatosModel.id)
            ? Icon(
                icon,
                color: Colors.red,
                size: 25,
              )
            : Icon(
                icon,
                color: Colors.grey.withOpacity(0.4),
                size: 25,
              ),
      ),
    );
  }
}
