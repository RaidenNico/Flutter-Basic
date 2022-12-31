import 'dart:convert';

import 'package:app_films/models/imports/models.dart';

class PopularResponse {
  PopularResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<MovieResponse> results;
  int totalPages;
  int totalResults;

  factory PopularResponse.fromJson(String str) =>
      PopularResponse.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory PopularResponse.fromMap(Map<String, dynamic> json) => PopularResponse(
        page: json["page"],
        results: List<MovieResponse>.from(
            json["results"].map((x) => MovieResponse.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
