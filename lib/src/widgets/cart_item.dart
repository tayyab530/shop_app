import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String productId;
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
    this.productId,
    this.id,
    this.title,
    this.quantity,
    this.price,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      background: Container(
        child: const Icon(Icons.delete_rounded),
        color: Theme.of(context).errorColor,
        alignment:  Alignment.centerRight,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        padding: const EdgeInsets.all(10.0),
      ),
      onDismissed: (direction) {Provider.of<Cart>(context,listen: false).removeItem(productId);},
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(child: Text('${price * quantity}')),
            ),
          ),
          title:  Text(title),
          subtitle: Text(price.toString()),
          trailing: Text(quantity.toString()),
        ),
      ),
    );
  }
}
