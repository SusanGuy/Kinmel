import 'dart:convert';
import "package:http/http.dart";
import 'package:flutter/material.dart';
import 'product.dart';
import "package:http/http.dart" as http;

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  Future<void> fetchAndSetProducts() async {
    const url = "https://flutter-tutorial-4abb4.firebaseio.com/products.json";
    try {
      final response = await http.get(url);
      final products = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> fetchedProducts = [];
      products.forEach((key, value) {
        fetchedProducts.add(Product(
            id: key,
            description: value["description"],
            title: value["title"],
            price: value["price"],
            isFavorite: value["isFavorite"],
            imageUrl: value["imageUrl"]));
      });
      _items = fetchedProducts;
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> addProduct(Product product) async {
    const url = "https://flutter-tutorial-4abb4.firebaseio.com/products.json";

    try {
      final response = await http.post(url,
          body: json.encode({
            "title": product.title,
            "description": product.description,
            "price": product.price,
            "imageUrl": product.imageUrl,
            "isFavorite": product.isFavorite
          }));
      final newProduct = Product(
          id: json.decode(response.body)['name'],
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl);

      _items.add(newProduct);
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }

  void editProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((element) => element.id == id);
    _items[prodIndex] = newProduct;
    notifyListeners();
  }

  void deleteProduct(String id) {
    final prodIndex = _items.indexWhere((element) => element.id == id);
    _items.removeAt(prodIndex);
    notifyListeners();
  }
}
