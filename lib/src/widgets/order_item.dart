import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/src/providers/cart.dart';

import '../providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var isExpand = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Column(
        children: [
          // DateFormat('')
          ListTile(
            title: Text('\$ ${widget.order.amount}'),
            subtitle: Text(
                '${DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime).toString()}'),
            trailing: IconButton(
                icon: Icon(isExpand
                    ? Icons.expand_less_rounded
                    : Icons.expand_more_rounded),
                onPressed: () {
                  setState(() {
                    isExpand = !isExpand;
                  });
                }),
          ),
          if (!isExpand)
            Container(
              height: min(widget.order.products.length * 20.0 + 10, 180.0),
              child: ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                  children: widget.order.products
                      .map((product) => buildDetailsList(product))
                      .toList()),
            ),
        ],
      ),
    );
  }
  
  Widget buildDetailsList(CartItem product) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        '${product.title}',
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      Text(
        '${product.quantity} x \$${product.price}',
        style: TextStyle(fontSize: 18.0, color: Colors.grey[500]),
      ),
    ]);
  }
}
