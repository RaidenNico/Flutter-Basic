import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

// ignore: non_constant_identifier_names, prefer_const_declarations
final _URL_NEWS = "https://newsapi.org/v2";
// ignore: prefer_const_declarations, non_constant_identifier_names
final _APIKEY = "bda7196021f7475ab262a3c595427fb6";

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  String _selectedCategory = "business";

  List<Category> categories = [
    Category(FontAwesomeIcons.building, "business"),
    Category(FontAwesomeIcons.tv, "entertainment"),
    Category(FontAwesomeIcons.addressCard, "general"),
    Category(FontAwesomeIcons.headSideVirus, "health"),
    Category(FontAwesomeIcons.vials, "science"),
    Category(FontAwesomeIcons.volleyball, "sports"),
    Category(FontAwesomeIcons.memory, "technology"),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();

    // ignore: avoid_function_literals_in_foreach_calls
    categories.forEach((item) {
      categoryArticles[item.name] = [];
    });
  }

  get selectedCategory => _selectedCategory;
  set setselectedCategory(String valor) {
    _selectedCategory = valor;

    getArticlesByCategory(valor);
    notifyListeners();
  }

  List<Article>? get getArticulosCategoriaSeleccionada =>
      categoryArticles[selectedCategory];

  getTopHeadlines() async {
    final url =
        Uri.parse("$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=mx");
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    // ignore: prefer_is_empty
    if (categoryArticles[category]!.length > 0) {
      return categoryArticles[category];
    }

    final url = Uri.parse(
        "$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=mx&category=$category");
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    categoryArticles[category]?.addAll(newsResponse.articles);
    notifyListeners();
  }
}
