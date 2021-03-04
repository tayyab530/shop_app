import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../screens/cart_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/badge.dart';
import './product_grid.dart';
import '../providers/product_provider.dart';

class ProductOverViewScreen extends StatefulWidget {
  @override
  _ProductOverViewScreenState createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  var _isFavourite = false;

  @override
  Widget build(BuildContext context) {
    final _productsData = Provider.of<ProductProvider>(context, listen: false);
    var _products =
        _isFavourite ? _productsData.favouriteItems : _productsData.items;

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) {
              return [
                PopupMenuItem(
                  child: Text('Only Favourite'),
                  value: Favourite.OnlyFavourite,
                ),
                PopupMenuItem(
                  child: Text('All'),
                  value: Favourite.All,
                ),
              ];
            },
            onSelected: (Favourite selected) {
              if (selected == Favourite.OnlyFavourite) {
                setState(() {
                  _isFavourite = true;
                });
              } else {
                setState(() {
                  _isFavourite = false;
                });
              }
            },
          ),
          Consumer<Cart>(
            builder: (_,cart,ch)=>Badge(
              child: ch,
              value: cart.itemsLength.toString(),
            ),
            child: IconButton(icon: Icon(Icons.shopping_cart_rounded),onPressed: () => goto(context),),
          ),
        ],
      ),
      body: ProductGrid(_products),
    );
  }

  goto(BuildContext ctx){
    Navigator.of(ctx).pushNamed(CartScreen.routeName);
  }
}

enum Favourite {
  OnlyFavourite,
  All,
}
