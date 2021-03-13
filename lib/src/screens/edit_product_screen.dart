import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit_product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocus = FocusNode();
  final _descriptionFocusNode = FocusNode();

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
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocus);
              },
            ),

            TextFormField(
              decoration: InputDecoration(
                labelText: 'Price',
                hintText: "23.1 \$",
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              focusNode: _priceFocus,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              }
            ),
            
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Desciption',
                hintText: "It's made of....",
              ),
              maxLines: 3,
              textInputAction: TextInputAction.newline,
              focusNode: _descriptionFocusNode,
            ),
          ],
        )),
      ),
    );
  }
}