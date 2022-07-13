import 'package:flutter/material.dart';
import 'package:noticias_app/src/services/news_services.dart';
import 'package:noticias_app/src/theme/tema.dart';
import 'package:noticias_app/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen>
// se convierte la screen a un statefulwidget y se conbina con el AutomaticKeepAliveClientMixin para no perder el estado de la pantall a la hora de cambiar de paginas o screens
    with
        AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    final newServices = Provider.of<NewsServices>(context);
    /* newServices.headLines; */

    return Scaffold(
        //se compara para que mientras no tenga nada cargado se muestre el icon de carga
        body: (newServices.headLines.isEmpty)
            ? Center(
                child: CircularProgressIndicator(
                color: miTema.colorScheme.secondary,
              ))
            : ListaNoticias(newServices.headLines));
  }

  @override
  bool get wantKeepAlive => true;
}
