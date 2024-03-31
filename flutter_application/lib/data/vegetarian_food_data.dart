import 'package:flutter_application/foodDetails/vegererian/broccoli_cheddar_soup.dart';
import 'package:flutter_application/foodDetails/vegererian/dutch_baby_pancake.dart';
import 'package:flutter_application/foodDetails/vegererian/homemade_fried_rice.dart';
import 'package:flutter_application/foodDetails/vegererian/pesto_spaghetti.dart';
import 'package:flutter_application/modules/food_data_module.dart';

List<FoodTypeModel> vegeData = [
  FoodTypeModel(
    id: 0,
    image: "assets/PestoSpaghetti.jpg",
    title: "Pesto Spaghetti",
    time: "30min",
    foodDetail: const PestoSpaghetti(),
    bookmark: false,
  ),
  FoodTypeModel(
    id: 1,
    image: "assets/BroccoliandCheddarSoup.jpg",
    title: "Broccoli Soup",
    time: "30min",
    foodDetail: const BroccoliSoup(),
    bookmark: false,
  ),
  FoodTypeModel(
    id: 2,
    image: "assets/DutchBabyPancake.jpg",
    title: "Dutch Pancake",
    time: "30min",
    foodDetail: const DutchPancake(),
    bookmark: false,
  ),
  FoodTypeModel(
    id: 3,
    image: "assets/HomemadeFriedRice.jpg",
    title: "Fried Rice",
    time: "30min",
    foodDetail: const HomeMadeRice(),
    bookmark: false,
  ),
];
