import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionScreen extends StatelessWidget {
  const NavegacionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => _NotificationModel(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink,
          title: const Center(child: Text('Notifications page')),
        ),
        floatingActionButton: const _BottonFlotante(),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numero = Provider.of<_NotificationModel>(context);

    return BottomNavigationBar(
      onTap: (index) => numero.paginaActual = index,
      currentIndex: numero.paginaActual,
      selectedItemColor: Colors.pink,
      items: [
        const BottomNavigationBarItem(
            label: 'Bones', icon: FaIcon(FontAwesomeIcons.bone)),
        BottomNavigationBarItem(
            label: 'Notifications',
            icon: Stack(
              children: [
                const FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  top: 0.0,
                  right: 0.5,
                  child: BounceInDown(
                    from: 10,
                    animate: (numero.numero > 0) ? true : false,
                    child: Bounce(
                      controller: (controller) =>
                          Provider.of<_NotificationModel>(context)
                              .bounceController = controller,
                      from: 10,
                      child: Container(
                        alignment: Alignment.center,
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                            color: Colors.redAccent, shape: BoxShape.circle),
                        child: Text(
                          '${numero.numero}',
                          style:
                              const TextStyle(color: Colors.white, fontSize: 7),
                        ),
                      ),
                    ),
                  ),
                  /* child: Icon(
                    Icons.brightness_1,
                    size: 8,
                    color: Colors.redAccent,
                  ), */
                )
              ],
            )),
        const BottomNavigationBarItem(
            label: 'My dog', icon: FaIcon(FontAwesomeIcons.dog)),
      ],
    );
  }
}

class _BottonFlotante extends StatelessWidget {
  const _BottonFlotante({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const FaIcon(FontAwesomeIcons.play),
        onPressed: () {
          final notiModel =
              Provider.of<_NotificationModel>(context, listen: false);
          //en este lugar se declara el provider
          int numero = notiModel.numero;

          // la variable creada anteriormente se le incrementa en 1

          numero++;
          //se le establece el valor de la variable al provider
          notiModel.numero = numero;
          //esta parte es para que la animacion de la notificacion se repita cuando se oprime el boton
          if (numero >= 2) {
            final controller =
                Provider.of<_NotificationModel>(context, listen: false)
                    .bounceController;
            controller.forward(from: 0.0);
          }
        });
  }
}

class _NotificationModel extends ChangeNotifier {
  int _paginaActual = 0;
  int _numero = 0;
  late AnimationController _bounceController;
  int get numero => _numero;
  set numero(int value) {
    _numero = value;
    notifyListeners();
  }

  int get paginaActual => _paginaActual;

  set paginaActual(int value) {
    _paginaActual = value;
    notifyListeners();
  }

  AnimationController get bounceController => _bounceController;
  set bounceController(AnimationController value) {
    _bounceController = value;
  }
}
