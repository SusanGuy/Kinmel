import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  ProductItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        this.imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: null,
        ),
        title: Text(this.title, textAlign: TextAlign.center),
        backgroundColor: Colors.black54,
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: null,
        ),
      ),
    );
  }
}