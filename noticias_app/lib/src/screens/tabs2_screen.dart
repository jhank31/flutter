import 'package:flutter/material.dart';
import 'package:noticias_app/src/models/category_model.dart';
import 'package:noticias_app/src/services/news_services.dart';
import 'package:noticias_app/src/theme/tema.dart';
import 'package:noticias_app/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Screen extends StatefulWidget {
  const Tab2Screen({Key? key}) : super(key: key);

  @override
  State<Tab2Screen> createState() => _Tab2ScreenState();
}

class _Tab2ScreenState extends State<Tab2Screen>
    with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    final newsServices = Provider.of<NewsServices>(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          _ListaCategorias(),
          Expanded(
              child: ListaNoticias(newsServices.getArticlesCategorySelected))
        ],
      )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsServices>(context).categories;
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final cName = categories[index].name;
          return Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _CategoryButton(categories[index]),
                const SizedBox(height: 10),
                //esta linea sirve para capitalizar las primera letra de las categorias
                Text('${cName[0].toUpperCase()}${cName.substring(1)}')
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;
  const _CategoryButton(
    this.category,
  );
  @override
  Widget build(BuildContext context) {
    final newsServices = Provider.of<NewsServices>(context);
    return GestureDetector(
      onTap: () {
        final newsServices = Provider.of<NewsServices>(context, listen: false);
        //Cuando se encuentra en un evento OnTap o click, va listen: false, para que no se redibuje.
        newsServices.selectedCategory = category.name;
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        width: 40,
        height: 40,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          category.icon,
          color: (newsServices.selectedCategory == category.name)
              ? miTema.colorScheme.secondary
              : Colors.black54,
        ),
      ),
    );
  }
}
