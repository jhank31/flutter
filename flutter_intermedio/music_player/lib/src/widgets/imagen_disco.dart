import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/models/audioplaer_model.dart';
import 'package:provider/provider.dart';

class ImagenDiscoDuracion extends StatelessWidget {
  const ImagenDiscoDuracion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.only(top: 70),
      child: Row(
        children: const [
          ImagenDisco(),
          SizedBox(
            width: 40,
          ),
          BarraProgreso(),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

class ImagenDisco extends StatelessWidget {
  const ImagenDisco({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      width: 225,
      height: 225,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
            Color(0xff484750),
            Color(0xff1e1c24),
          ])),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(alignment: Alignment.center, children: [
          SpinPerfect(
              duration: const Duration(seconds: 10),
              animate: false,
              manualTrigger: true,
              controller: (animatinoController) =>
                  audioPlayerModel.controller = animatinoController,
              infinite: true,
              child: const Image(image: AssetImage('assets/aurora.jpg'))),
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(100)),
          ),
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: const Color(0xff1c1c25),
                borderRadius: BorderRadius.circular(100)),
          ),
        ]),
      ),
    );
  }
}

class BarraProgreso extends StatelessWidget {
  const BarraProgreso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    final porcentaje = audioPlayerModel.porcentaje;
    return Column(
      children: [
        Text(
          audioPlayerModel.songTotalDuration,
          style: TextStyle(color: Colors.white.withOpacity(0.4)),
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Container(
              width: 3,
              height: 230,
              color: Colors.white.withOpacity(0.2),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 3,
                height: 230 * porcentaje,
                color: Colors.white.withOpacity(0.8),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          audioPlayerModel.currentSecond,
          style: TextStyle(color: Colors.white.withOpacity(0.4)),
        ),
      ],
    );
  }
}
