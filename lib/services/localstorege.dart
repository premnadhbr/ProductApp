import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../Model/product_model.dart';

class ProductLocalStorage {
  static const _productsKey = 'products_key';

  Future<void> saveProducts(List<ProductModel> products) async {
    final prefs = await SharedPreferences.getInstance();
    final productsJson = jsonEncode(products.map((e) => e.toJson()).toList());
    await prefs.setString(_productsKey, productsJson);
  }

  Future<List<ProductModel>> getProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final productsJson = prefs.getString(_productsKey);
    
    if (productsJson == null) {
      return [];
    }

    final List<dynamic> decodedList = jsonDecode(productsJson);
    return decodedList.map((item) => ProductModel.fromJson(item)).toList();
  }
}
