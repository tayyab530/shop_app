import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    
    final productId = ModalRoute.of(context).settings.arguments;
    final product = Provider.of<ProductProvider>(context,listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Center(child: Image.network(product.imageUrl)),
    );
  }
}
