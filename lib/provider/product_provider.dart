import 'package:flutter/material.dart';
import 'package:shamo_mobile/models/product_model.dart';
import 'package:shamo_mobile/services/product_services.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();
      _products = products;
    } catch (e) {
      // print(e);
    }
  }
}
