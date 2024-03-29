import 'package:flutter/material.dart';
import 'package:flutter_application/modules/food_data_module.dart';

class BookmarkProvider extends ChangeNotifier {
  List<FoodTypeModel> _widget = [];
  List<FoodTypeModel> get widget => _widget;
  void addItems(FoodTypeModel items) {
    final isExit = _widget.contains(items);
    if (isExit) {
      _widget.remove(items);
    } else {
      _widget.add(items);
    }
    notifyListeners();
  }

  bool isExist(FoodTypeModel items) {
    final isExist = _widget.contains(items);
    return isExist;
  }

  void removeItems() {
    _widget = [];
    notifyListeners();
  }
  // void addItems(FoodTypeModel items) {
  //   _widget.add(items);
  //   notifyListeners();
  // }

  // void removeItem(FoodTypeModel items) {
  //   _widget.remove(items);
  //   notifyListeners();
  // }
}
