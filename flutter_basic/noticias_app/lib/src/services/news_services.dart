import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticias_app/src/models/category_model.dart';
import 'package:noticias_app/src/models/news_response.dart';
import 'package:http/http.dart' as http;

const _urlNews = 'newsapi.org';
const _apiKey = '952288bde14141eeac50ccc6195ad52e';

class NewsServices with ChangeNotifier {
  List<Article> headLines = [];
  String _selectedCategory = 'business';
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.futbol, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  final bool isLoading = true;

  Map<String, List<Article?>?> categoryArticles = {};

  //este es el metodo constructor para traer las newlines
  NewsServices() {
    getTopHeandlines();
    // ignore: avoid_function_literals_in_foreach_calls
    categories.forEach((items) {
      categoryArticles[items.name] = List<Article>.empty(growable: true);
    });
    getArticlesByCategory(_selectedCategory);
  }
  //se crean los metodos  de getter y setter para saber que  categoria es la que esta seleccionda
  String get selectedCategory => _selectedCategory;
  set selectedCategory(String value) {
    _selectedCategory = value;
    getArticlesByCategory(value);
    notifyListeners();
  }

  //metodo para traer los newlines de la API
  getTopHeandlines() async {
    final url = Uri.https(_urlNews, 'v2/top-headlines', {
      'country': 'co',
      'apikey': _apiKey,
    });
    final resp = await http.get(url);
    final newResponse = newsResponseFromJson(resp.body);
    headLines.addAll(newResponse.articles);
  }

  //metodo para traer las informacion de la APi
  getArticlesByCategory(String category) async {
    //Llamada Http.

    //Validar para no insertar duplicados
    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category]; //Se retorna el listado que se tiene.
    }

    //Generacion de la URL HTTPS
    final url = Uri.https(_urlNews, 'v2/top-headlines', {
      'country': 'co',
      'category': category,
      'apikey': _apiKey,
    });

    final response = await http.get(url);
    final newsResponse =
        newsResponseFromJson(response.body); //json.decode(response.body);
    categoryArticles[category]!.addAll(newsResponse.articles);
    notifyListeners(); //Notifica a todos los listener.
  }

  get getArticlesCategorySelected => categoryArticles[
      selectedCategory]; //Get para retornar los Articulos de la categoria seleccionada.
}
