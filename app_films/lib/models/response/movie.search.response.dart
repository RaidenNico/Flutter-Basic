import 'dart:convert';

import 'package:app_films/models/response/movie.response.dart';

class MovieSearchResponse {
  MovieSearchResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<MovieResponse> results;
  int totalPages;
  int totalResults;

  factory MovieSearchResponse.fromJson(String str) =>
      MovieSearchResponse.fromMap(json.decode(str));

  factory MovieSearchResponse.fromMap(Map<String, dynamic> json) =>
      MovieSearchResponse(
        page: json["page"],
        results: List<MovieResponse>.from(
            json["results"].map((x) => MovieResponse.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
