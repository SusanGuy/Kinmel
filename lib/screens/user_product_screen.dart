import 'package:Kinmel/providers/products.dart';
import 'package:Kinmel/screens/edit_product.dart';
import 'package:Kinmel/widgets/app_drawer.dart';
import 'package:Kinmel/widgets/user_product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = "/user-products";
  Future<void> fetchProducts(BuildContext context) async {
    await Provider.of<Products>(context).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text("Your Products"),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () =>
                  Navigator.of(context).pushNamed(EditProductScreen.routeName))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => fetchProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemBuilder: (_, i) {
              return Column(
                children: <Widget>[
                  UserProductItem(products.items[i].id, products.items[i].title,
                      products.items[i].imageUrl),
                  Divider(),
                ],
              );
            },
            itemCount: products.items.length,
          ),
        ),
      ),
    );
  }
}
