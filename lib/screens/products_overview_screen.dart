import 'package:Kinmel/providers/Cart.dart';
import 'package:Kinmel/providers/products.dart';
import 'package:Kinmel/screens/cart_screen.dart';
import 'package:Kinmel/widgets/app_drawer.dart';
import 'package:Kinmel/widgets/badge.dart';
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
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      try {
        Provider.of<Products>(context).fetchAndSetProducts().then((_) {
          setState(() {
            _isLoading = false;
          });
        });
      } catch (e) {
        print(e);
      }
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
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
          Consumer<Cart>(
            builder: (ctx, cart, child) =>
                Badge(child: child, value: cart.itemCount.toString()),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductsGrid(_showOnlyFavorites),
    );
  }
}
