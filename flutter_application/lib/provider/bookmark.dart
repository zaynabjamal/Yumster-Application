import 'package:flutter/material.dart';
import 'package:flutter_application/model/food_type.dart';

class bookmarkProvider extends ChangeNotifier {
  final List<FoodTypeModel> _widget = [];
  List<FoodTypeModel> get Widget => _widget;

  void addItems(FoodTypeModel items) {
    _widget.add(items);
    notifyListeners();
  }

  void removeItem(FoodTypeModel items) {
    _widget.remove(items);
    notifyListeners();
  }
}
