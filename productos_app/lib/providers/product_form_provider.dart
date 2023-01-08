import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Product? product;

  ProductFormProvider(this.product);

  updateAvailability(bool value) {
    // ignore: avoid_print
    print(value);
    product?.availabel = value;
    notifyListeners();
  }

  bool isValidForm() {
    // ignore: avoid_print
    print(product?.name);
    // ignore: avoid_print
    print(product?.price);
    // ignore: avoid_print
    print(product?.availabel);

    return formKey.currentState?.validate() ?? false;
  }
}
