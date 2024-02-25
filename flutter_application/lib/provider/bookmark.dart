import 'package:flutter/material.dart';

class bookmarkProvider<food_type> extends ChangeNotifier{

final List<food_type> _widget=[];
List<food_type> get Widget => _widget;
void addItems(food_type items){
  _widget.add(items);
  notifyListeners();
}










}