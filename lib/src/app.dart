import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/src/providers/product_provider.dart';
import 'package:shop_app/src/screens/product_details_screen.dart';

import 'screens/homePage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ProductProvider(), //When first intanstiate, should use create syntax 
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.deepOrangeAccent,
          fontFamily: 'Lato',
        ),
        home: HomePage(),
        routes: {
          ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
        },
      ),
    );
  }
}
