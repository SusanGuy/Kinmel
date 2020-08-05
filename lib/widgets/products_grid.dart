import 'package:Kinmel/providers/products.dart';
import 'package:Kinmel/widgets/product_item.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final loadedProducts = products.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) {
          return ProductItem(loadedProducts[i].id, loadedProducts[i].title,
              loadedProducts[i].imageUrl);
        });
  }
}
