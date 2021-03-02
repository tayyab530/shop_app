import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_Item.dart';
import '../providers/products.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> _products;

  ProductGrid(this._products);

  @override
  Widget build(BuildContext context) {
    
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 15.0,
      ),
      itemBuilder: (ctx, i) {
        return ChangeNotifierProvider.value(    //this syntax is best for listView and GridView else it prones errors 
          value: _products[i],
          child: ProductItem(),
        );
      },
      itemCount: _products.length,
    );
  }
}
