import 'package:flutter/material.dart';

import '../widgets/radial_progress.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key? key}) : super(key: key);

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
          child: Container(
        height: 300,
        width: 300,
        child: RadiualProgress(
          porcentaje: porcentaje,
          colorPrimario: Colors.purple,
          colorSecundario: Colors.grey,
        ),
      )),
    );
  }
}
