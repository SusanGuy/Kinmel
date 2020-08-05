import 'package:Kinmel/providers/products.dart';
import 'package:Kinmel/widgets/products_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOptions { Favorites, All }

class ProductsOverViewScreen extends StatefulWidget {
  @override
  _ProductsOverViewScreenState createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kinmel"),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.All) {
                    _showOnlyFavorites = false;
                  } else {
                    _showOnlyFavorites = true;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                        child: Text("Only Favorites"),
                        value: FilterOptions.Favorites),
                    PopupMenuItem(
                        child: Text("Show All"), value: FilterOptions.All),
                  ]),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
