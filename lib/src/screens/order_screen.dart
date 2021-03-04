import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:shop_app/src/widgets/app_drawer.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final _orderData = Provider.of<Orders>(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text('Your Orders')),
      body: ListView.builder(
        itemCount: _orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(
          _orderData.orders[i],
        ),
      ),
    );
  }
}
