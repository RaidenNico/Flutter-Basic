// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class Product {
  Product({
    required this.availabel,
    required this.name,
    this.picture,
    required this.price,
  });

  bool availabel;
  String name;
  String? picture;
  double price;
  String? id;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        availabel: json["availabel"],
        name: json["name"],
        picture: json["picture"] == null ? null : json["picture"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "availabel": availabel,
        "name": name,
        "picture": picture == null ? null : picture,
        "price": price,
      };
}
