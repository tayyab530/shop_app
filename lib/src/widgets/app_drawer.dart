import 'package:flutter/material.dart';
import 'package:shop_app/src/screens/order_screen.dart';
import 'package:shop_app/src/screens/user_product_screen.dart';

class AppDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hey Buddy!'),
          ),
          ListTile(
            leading: Icon(Icons.shop_rounded),
            title: Text('Shop'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment_rounded),
            title: Text('Order'),
            onTap: () => Navigator.of(context).pushReplacementNamed(OrderScreen.routeName),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () => Navigator.of(context).pushReplacementNamed(UserProductScreen.routeName),
          ),
        ],
      ),
    );
  }
}
