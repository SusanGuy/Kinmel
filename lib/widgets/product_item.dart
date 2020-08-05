import 'package:Kinmel/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  ProductItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailScreen.routeName, arguments: this.id);
          },
          child: Image.network(
            this.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(
              Icons.favorite,
              color: Theme.of(context).accentColor,
            ),
            onPressed: null,
          ),
          title: Text(this.title, textAlign: TextAlign.center),
          backgroundColor: Colors.black87,
          trailing: IconButton(
            icon:
                Icon(Icons.shopping_cart, color: Theme.of(context).accentColor),
            onPressed: null,
          ),
        ),
      ),
    );
  }
}
