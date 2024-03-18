import 'package:flutter/material.dart';
import 'package:flutter_application/modules/food_type.dart';

class BookmarkProvider extends ChangeNotifier {
  final List<FoodTypeModel> _widget = [];
  List<FoodTypeModel> get widget => _widget;

  void addItems(FoodTypeModel items) {
    _widget.add(items);
    notifyListeners();
  }

  void removeItem(FoodTypeModel items) {
    _widget.remove(items);
    notifyListeners();
  }
}
