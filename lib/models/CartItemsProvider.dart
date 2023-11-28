import 'package:flutter/foundation.dart';
import 'package:groceryapp/models/CartItemModel.dart';
import 'package:flutter/material.dart';

class CartItemsProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  void reduceQuantity(BuildContext context, int index) {
    if (_cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
      notifyListeners();
    } else {
      // Show confirmation dialog before removing the item
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Remove Item'),
            content: const Text('Are you sure you want to remove this item?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  removeFromCart(index);
                  Navigator.pop(context);
                },
                child: const Text('Remove'),
              ),
            ],
          );
        },
      );
    }
  }
}
