import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Chip(
                      label: Text(
                    '\$${_cart.totalAmount}',
                  )),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'ORDER',
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            // width: MediaQuery.of(context).size.width - 5.0,
            height: MediaQuery.of(context).size.height - 200.0,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                var item = _cart.item.values.toList()[index];
                return CartItem(item.id,item.title,item.quantity,item.price);
              },
              itemCount: _cart.itemsLength,
            ),
          ),
        ],
      ),
    );
  }
}
