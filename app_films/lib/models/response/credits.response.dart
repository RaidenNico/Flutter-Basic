import 'dart:convert';

import 'package:app_films/models/imports/models.dart';

class CreditsResponse {
  CreditsResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  int id;
  List<CastResponse> cast;
  List<CastResponse> crew;

  factory CreditsResponse.fromJson(String str) =>
      CreditsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreditsResponse.fromMap(Map<String, dynamic> json) => CreditsResponse(
        id: json["id"],
        cast: List<CastResponse>.from(
            json["cast"].map((x) => CastResponse.fromMap(x))),
        crew: List<CastResponse>.from(
            json["crew"].map((x) => CastResponse.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toMap())),
        "crew": List<dynamic>.from(crew.map((x) => x.toMap())),
      };
}
