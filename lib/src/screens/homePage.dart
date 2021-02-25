import 'package:flutter/material.dart';
import 'package:shop_app/src/screens/product_OverView_Screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: ProductOverViewScreen(),
    );
  }
}