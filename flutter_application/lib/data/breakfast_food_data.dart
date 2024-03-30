import 'package:flutter_application/foodDetails/breakfast/bread_details.dart';
import 'package:flutter_application/foodDetails/breakfast/chickpea_details.dart';
import 'package:flutter_application/foodDetails/breakfast/flowerpower_details.dart';
import 'package:flutter_application/foodDetails/breakfast/shakshuka_details.dart';
import 'package:flutter_application/modules/food_data_module.dart';

List<FoodTypeModel> breakFastData = [
  FoodTypeModel(
    id: 0,
    image: "assets/shakshuka.jpg",
    title: "Egg Dish",
    time: "20min",
    foodDetail: const ShakShuka(),
    bookmark: false,
  ),
  FoodTypeModel(
    id: 0,
    image: "assets/flowerpower.jpeg",
    title: "FlowerPower",
    time: "15min",
    foodDetail: const FlowerPower(),
    bookmark: false,
  ),
  FoodTypeModel(
    id: 0,
    image: "assets/chickpea.jpeg",
    title: "ChickPea",
    time: "25min",
    foodDetail: const ChickPea(),
    bookmark: false,
  ),
  FoodTypeModel(
    id: 0,
    image: "assets/bread.jpeg",
    title: "BreadPudding",
    time: "35min",
    foodDetail: const Bread(),
    bookmark: false,
  ),

];
