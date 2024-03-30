import 'package:flutter_application/foodDetails/lunch/chicken_strips_detail.dart';
import 'package:flutter_application/foodDetails/lunch/chicken_thai_details.dart';
import 'package:flutter_application/foodDetails/lunch/clay_rice_detail.dart';
import 'package:flutter_application/foodDetails/lunch/dolma_details.dart';
import 'package:flutter_application/modules/food_data_module.dart';

List<FoodTypeModel> lunchData = [
  FoodTypeModel(
    id: 0,
    image: "assets/chickenStrips.jpeg",
    title: "Chicken Strips",
    time: "50min",
    foodDetail: const ChickenStrips(),
    bookmark: false,

  ),
  FoodTypeModel(
    id: 0,
    image: "assets/chickenFried.jpeg",
    title: "ThaiChickenRice",
    time: "55min",
    foodDetail: const ThaiRice(),
    bookmark: false,

  ),
  FoodTypeModel(
    id: 0,
    image: "assets/dolma.jpeg",
    title: "Dollma",
    time: "1hr",
    foodDetail: const Dolma(),
    bookmark: false,

  ),
  FoodTypeModel(
    id: 0,
    image: "assets/clay-pot-rice-26.webp",
    title: "Clay Rice",
    time: "50min",
    foodDetail: const ClayRice(),
    bookmark: false,

  ),

];
