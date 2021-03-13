import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit_product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: "Fleece Shirt",
              ),
              textInputAction: TextInputAction.next,
            ),
          ],
        )),
      ),
    );
  }
}