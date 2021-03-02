import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
    this.id,
    this.title,
    this.quantity,
    this.price,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: ListTile(
        leading: CircleAvatar(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(child: Text('${price * quantity}')),
          ),
        ),
        title: Text(title),
        subtitle: Text(price.toString()),
        trailing: Text(quantity.toString()),
      ),
    );
  }
}
