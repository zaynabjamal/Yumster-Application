import 'package:flutter/material.dart';

class FoodTypeModel {
  int id;
  String image;
  String title;
  String time;
  bool bookmark;
  Widget foodDetail;

  FoodTypeModel({
    required this.id,
    required this.image,
    required this.title,
    required this.time,
    required this.foodDetail,
    this.bookmark = false,
  });

  void toggleBookmarkRandomly() {
    bookmark = bookmark;
  }
}
