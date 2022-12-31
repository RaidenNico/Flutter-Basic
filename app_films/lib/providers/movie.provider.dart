import 'dart:async';

import 'package:app_films/helpers/debouncer.dart';
import 'package:app_films/models/imports/models.dart';
import 'package:app_films/models/response/credits.response.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = 'c990f7fbf404075dc2cbd5e58a4f04de';
  final String _baseUrl = 'api.themoviedb.org';
  final String _languaje = 'es-ES';

  List<MovieResponse> onDisplayMobies = [];
  List<MovieResponse> popularMovies = [];

  Map<int, List<CastResponse>> moviesCast = {};

  int _popularPage = 0;

  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );

  final StreamController<List<MovieResponse>> _sugestionStreamController =
      StreamController.broadcast();

  Stream<List<MovieResponse>> get sugestionStream =>
      _sugestionStreamController.stream;

  MoviesProvider() {
    print('MoviesProvider inicializado');
    getOnDisplayMovies();
    getPopularMovies();
  }
  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('/3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMobies = nowPlayingResponse.results;
    notifyListeners(); // Notified widgets on chang
  }

  getPopularMovies() async {
    _popularPage++;
    final jsonData = await _getJsonData('/3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    //print(popularMovies[0]);
    notifyListeners(); //
  }

  Future<List<CastResponse>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await _getJsonData('/3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  Future<List<MovieResponse>> searchMovie(String query) async {
    final url = Uri.https(_baseUrl, '/3/search/movie', {
      'api_key': _apiKey,
      'language': _languaje,
      //'include_adult': true,
      'query': query,
    });

    final response = await http.get(url);
    final searchResponse = MovieSearchResponse.fromJson(response.body);
    return searchResponse.results;
  }

  void getSuggestionsByQuery(String query) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      //print('Tenemos valor a buscar: $value');
      final results = await searchMovie(value);
      _sugestionStreamController.add(results);
    };
    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = query;
    });

    Future.delayed(const Duration(
      milliseconds: 301,
    )).then(
      (_) => timer.cancel(),
    );
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _languaje,
      'page': '$page',
    });

    final response = await http.get(url);
    return response.body;
  }
}
