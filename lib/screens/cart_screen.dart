import 'package:Kinmel/providers/Cart.dart' show Cart;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "../widgets/cart_item.dart";

class CartScreen extends StatelessWidget {
  static const routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Total",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    Spacer(),
                    Chip(
                      label: Text(
                        '\$${cart.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .headline6
                                .color),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text("ORDER NOW"),
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, i) {
              final cartItems = cart.items.values.toList();
              return CartItem(
                  id: cartItems[i].id,
                  productId: cart.items.keys.toList()[i],
                  quantity: cartItems[i].quantity,
                  title: cartItems[i].title,
                  price: cartItems[i].price);
            },
            itemCount: cart.itemCount,
          ))
        ],
      ),
    );
  }
}
