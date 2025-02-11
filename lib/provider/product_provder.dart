// TODO Implement this library.
import "dart:convert";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "../models/product.dart";

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
  String? _errorMessage;
  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  Future<void> fetchAllProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      final response =
          await http.get(Uri.parse("https://fakestoreapi.com/products"));
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        _products = jsonData.map((item) => Product.fromJson(item)).toList();
      } else {
        _errorMessage = "Failed to load products";
      }
    } catch (error) {
      _errorMessage = "Error: $error";
    }
    _isLoading = false;
    notifyListeners();
  }
}
