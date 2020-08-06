import 'package:Kinmel/providers/orders.dart' show Orders;
import 'package:Kinmel/widgets/app_drawer.dart';
import 'package:Kinmel/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/orders";
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("Your Orders")),
      body: ListView.builder(
          itemBuilder: (ctx, i) => OrderItem(orders.orders[i]),
          itemCount: orders.orders.length),
    );
  }
}
