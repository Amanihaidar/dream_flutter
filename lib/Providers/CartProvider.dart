import 'package:dreamapp/models/product.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Product> _cartItems = []; 
  List<Product> get cartItems => _cartItems;

  void addItem(Product product) {
    _cartItems.add(product);
    notifyListeners(); 
  }

  void removeItem(Product product) {
    _cartItems.remove(product);
    notifyListeners(); 
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners(); 
  }

  double get totalCost {
    return _cartItems.fold(0, (total, item) => total + item.price); 
  }
}