import 'package:flutter/material.dart';
import 'package:noticias_app/src/screens/tabs1_screen.dart';
import 'package:noticias_app/src/screens/tabs2_screen.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModel(),
      child: const Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return BottomNavigationBar(
        //esta linea lo que hace es notificar en que parte indice de los botones esta, si en el 0 o el 1
        currentIndex: navegacionModel.paginaActual,
        //en esta linea el ontap esta escuchando en que si se esta cabiando de boton o no
        onTap: (i) => navegacionModel.paginaActual = i,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Para ti',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.public), label: 'Encabezados')
        ]);
  }
}

//este widget nos muestra las paginas que se corren de manera horizontal
class _Paginas extends StatelessWidget {
  const _Paginas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      controller: navegacionModel.pageController,
      //esto evita que la persona pueda hacer scroll en el pageview
      physics: const NeverScrollableScrollPhysics(),
      children: const <Widget>[
        Tab1Screen(),
        Tab2Screen(),
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  //propiedad orivada de la clase
  int _paginaActual = 0;

  final PageController _pageController = PageController();

  //el get toma  el valor y se lo asigna a la propiedad privada
  int get paginaActual => _paginaActual;
  //el set establece al valor de la propiedad privada de manera publica
  set paginaActual(int valor) {
    //esta parte es para que se cambien las paginas dependiendo del boton que se oprima
    _pageController.animateToPage(valor,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    _paginaActual = valor;
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
