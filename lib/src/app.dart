import 'package:flutter/material.dart';

import 'screens/homePage.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.yellowAccent,
        fontFamily: 'Lato',
      ),
      home: HomePage(),
    );
  }
}