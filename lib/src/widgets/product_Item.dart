import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/src/providers/products.dart';
import 'package:shop_app/src/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _product = Provider.of<Product>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey),
        ),
        child: GridTile(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
                ProductDetailsScreen.routeName,
                arguments: _product.id),
            child: Image.network(
              _product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(_product.title, textAlign: TextAlign.center),
            leading: Consumer<Product>(                                   //efficient way to listen data, only perticular.. 
              builder: (context, value, child) => IconButton(             //..widget or widget tree will be randered
                icon: Icon(                                               //child will be the constant tree or widget within..
                  _product.isFavourite                                    //..the "Consumer"
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () => _product.toggleIsFavourite(),
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart_rounded,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
