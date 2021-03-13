import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../providers/product_provider.dart';
import '../widgets/user_product_item.dart';
import '../providers/products.dart';
import 'edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user_product';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(EditProductScreen.routeName),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: buildList(productData.items),
      ),
    );
  }

  Widget buildList(List<Product> items) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          Column(
            children: [
              UserProductItem(items[index].title, items[index].imageUrl),
              Divider(),
            ],
          ),
      itemCount: items.length,
    );
  }
}
