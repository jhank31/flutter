import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  final Color backgrodunColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  
  const PinterestMenu(
      {Key? key,
      this.mostrar = true,
      this.backgrodunColor = Colors.white,
      this.activeColor = Colors.red,
      this.inactiveColor = Colors.blueGrey, 
      required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: (mostrar) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).backgrodunColor = backgrodunColor;
            Provider.of<_MenuModel>(context).activeColor = activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;
            return _PinterestMenuBackground(
              child: _MenusItems(items),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  const _PinterestMenuBackground({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgrodunColor;
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: const [
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]),
      child: child,
    );
  }
}

class PinterestButton {
  void Function() onPressed;
  final IconData icon;
  PinterestButton({required this.onPressed, required this.icon});
}

class _MenusItems extends StatelessWidget {
  final List<PinterestButton> items;
  const _MenusItems(this.items);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(items.length,
            (index) => _PinterestMenuButton(index, items[index])));
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;
  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    final menuModel = Provider.of<_MenuModel>(context);
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed();
      },
      //esto es para si depronto no funciona bien el onTap en el dispostivo
      behavior: HitTestBehavior.translucent,
      child: Icon(item.icon,
          size: (itemSeleccionado == index) ? 35 : 25,
          color: (itemSeleccionado == index)
              ? menuModel.activeColor
              : menuModel.inactiveColor),
    );
  }
}

//aca va el provider
class _MenuModel extends ChangeNotifier {
  int _itemSeleccionado = 0;
  Color backgrodunColor = Colors.white;
  Color activeColor = Colors.red;
  Color inactiveColor = Colors.blueGrey;

  int get itemSeleccionado => _itemSeleccionado;
  set itemSeleccionado(int value) {
    _itemSeleccionado = value;
    notifyListeners();
  }
}
