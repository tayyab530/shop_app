import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    
    final productId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(productId)),
      body: Center(child: Text('Details')),
    );
  }
}
