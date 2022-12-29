import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:productos_app/models/product.dart';
import "package:http/http.dart" as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = "flutter-varios-95f3a-default-rtdb.firebaseio.com";

  final List<Product> products = [];
  bool isLoading = true;

  ProductsService() {
    this.loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.http(_baseUrl, "products.json");
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      this.products.add(tempProduct);
    });

    this.isLoading = false;
    notifyListeners();
    return this.products;
  }
}
