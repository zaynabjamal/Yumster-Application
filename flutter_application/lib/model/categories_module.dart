import 'package:flutter/material.dart';

class Category {
  AssetImage image;
  String text;
  String route;

  Category({required this.image, required this.text, required this.route});

  static List<Category> getCategory() {
    List<Category> items = [];
    items.add(
      Category(
          image: const AssetImage('assets/Rectangle 4.png'),
          text: 'Breakfast',
          route: '/breakfast'),
    );
    items.add(
      Category(
          image: const AssetImage('assets/Rectangle 4 (1).png'),
          text: 'Lunch',
          route: '/lunch'),
    );
    items.add(
      Category(
          image: const AssetImage('assets/Rectangle 5.png'),
          text: 'Diet',
          route: '/diet'),
    );
    items.add(
      Category(
          image: const AssetImage('assets/Rectangle 6.png'),
          text: 'Vegetarian',
          route: '/vegan'),
    );
    items.add(
      Category(
          image: const AssetImage('assets/seafood.png'),
          text: 'Sea Food',
          route: '/sea'),
    );
    items.add(
      Category(
          image: const AssetImage('assets/Others.png'),
          text: 'Others',
          route: '/others'),
    );
    return items;
  }
}
