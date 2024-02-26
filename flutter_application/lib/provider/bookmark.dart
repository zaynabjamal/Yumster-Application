import 'package:flutter/material.dart';
import 'package:flutter_application/model/food_type.dart';

class bookmarkProvider extends ChangeNotifier {
  final List<food_type> _cards = [];
  List<food_type> get cards => _cards;

  void addItem(food_type courseCart) {
    _cards.add(courseCart);
    notifyListeners();
  }

  void removeItem(food_type courseCart) {
    _cards.remove(courseCart);
    notifyListeners();
  }
}
