import 'package:Kinmel/widgets/products_grid.dart';
import 'package:flutter/material.dart';

class ProductsOverViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kinmel")),
      body: ProductsGrid(),
    );
  }
}
