import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get item => {..._items};

  int get itemsLength => _items.length;

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, product) { 
      total += (product.price * product.quantity);
    });
    return total;
  }

  void removeItem(String productId){
     _items.remove(productId);
     notifyListeners();
  }

  addItemToCart(String id, String title, double price) {
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (existingItem) => CartItem(
              id: existingItem.id,
              title: existingItem.title,
              price: existingItem.price,
              quantity: (existingItem.quantity + 1)));
    } else {
      _items.putIfAbsent(
          id, () => CartItem(id: id, title: title, price: price, quantity: 1));
    }
    notifyListeners();
  }

  void clearCart(){
    _items = {};
    notifyListeners();
  }
}
