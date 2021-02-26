import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/src/providers/product_provider.dart';

import '../widgets/product_Item.dart';

class ProductOverViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _products = Provider.of<ProductProvider>(context).items;
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
