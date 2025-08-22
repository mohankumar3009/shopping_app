import 'dart:collection';
import 'package:flutter/material.dart';

import 'package:shopping_app/models/list_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Item> _cartItems = [];
  int _counter = 0;

  UnmodifiableListView<Item> get cartItems => UnmodifiableListView(_cartItems);

  int get counter => _counter;

  double get totalPrice =>
      _cartItems.fold<double>(0.0, (prev, element) => prev + element.price);

  void addItem(Item item) {
    _cartItems.add(item);
    _counter = _cartItems.length;
    notifyListeners();
  }

  void removeItem(Item item) {
    _cartItems.remove(item);
    _counter = _cartItems.length;
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    _counter = 0;
    notifyListeners();
  }

  String itemAddedMessage(Item item) => "${item.name} added to cart";

  String itemRemovedMessage(Item item) => "${item.name} removed to cart";
}
