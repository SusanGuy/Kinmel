import 'package:Kinmel/providers/Cart.dart';
import 'package:Kinmel/providers/orders.dart';
import 'package:Kinmel/screens/cart_screen.dart';
import 'package:Kinmel/screens/edit_product.dart';
import 'package:Kinmel/screens/order_screen.dart';
import 'package:Kinmel/screens/product_detail_screen.dart';
import 'package:Kinmel/screens/products_overview_screen.dart';
import 'package:Kinmel/screens/user_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "./providers/products.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: "Lato",
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: "/",
        routes: {
          "/": (ctx) => ProductsOverViewScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen()
        },
      ),
    );
  }
}
