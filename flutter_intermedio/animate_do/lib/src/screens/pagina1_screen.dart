import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/src/screens/navegacion_screen.dart';
import 'package:animate_do_app/src/screens/twitter_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pagina1Screen extends StatelessWidget {
  const Pagina1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const TwitterScreen()));
              },
              icon: const FaIcon(FontAwesomeIcons.twitter)),
          IconButton(
              onPressed: () {
                //esto es para navegar a la misma pagina

                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (BuildContext context) =>
                            const Pagina1Screen()));
              },
              icon: const Icon(Icons.navigate_next)),
        ],
        title: const Text('Animate do'),
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          child: const FaIcon(FontAwesomeIcons.play),
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (BuildContext context) =>
                        const NavegacionScreen()));
          },
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElasticIn(
              delay: const Duration(milliseconds: 1100),
              child:
                  const Icon(Icons.new_releases, color: Colors.blue, size: 40)),
          FadeInDown(
            //el delayed es para que la animacion tarde en empezar
            delay: const Duration(milliseconds: 200),
            child: const Text(
              'Titulo',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
            ),
          ),
          FadeInDown(
            delay: const Duration(milliseconds: 800),
            child: const Text(
              'Soy un texto pequeño',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          FadeInLeft(
            delay: const Duration(milliseconds: 1100),
            child: Container(
              width: 220,
              height: 2,
              color: Colors.blue,
            ),
          )
        ],
      )),
    );
  }
}
