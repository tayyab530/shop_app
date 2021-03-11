import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  UserProductItem(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: FittedBox(
        fit: BoxFit.contain,
        child: Row(
          children: [
            buildIconButton(Icons.edit, () {}, Theme.of(context).primaryColor),
            buildIconButton(Icons.delete, () {}, Theme.of(context).errorColor),
          ],
        ),
      ),
    );
  }

  Widget buildIconButton(IconData icon, Function onPressed, Color color) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      color: color,
    );
  }
}
