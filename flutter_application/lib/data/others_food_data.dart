import 'package:flutter_application/foodDetails/breakfast/flowerpower_details.dart';
import 'package:flutter_application/foodDetails/dinner/pasta_puttanesca.dart';
import 'package:flutter_application/foodDetails/lunch/chicken_thai_details.dart';
import 'package:flutter_application/foodDetails/vegererian/dutch_baby_pancake.dart';
import 'package:flutter_application/modules/food_data_module.dart';

List<FoodTypeModel> foodTypeData = [
  FoodTypeModel(
    id: 0,
    image: "assets/flowerpower.jpeg",
    title: "FlowerPower",
    time: "15min",
    foodDetail: const FlowerPower(),
    bookmark: false,
  ),
  FoodTypeModel(
    id: 1,
    image: "assets/chickenFried.jpeg",
    title: "ThaiChickenRice",
    time: "55min",
    foodDetail: const ThaiRice(),
    bookmark: false,
  ),
  FoodTypeModel(
    id: 2,
    image: "assets/Spaghettiallaputtanesca.jpg",
    title: "Pasta Puttanesca",
    time: "20min",
    foodDetail: const PastaPuttanesc(),
    bookmark: false,
  ),
  FoodTypeModel(
    id: 3,
    image: "assets/DutchBabyPancake.jpg",
    title: "Dutch Pancake",
    time: "30min",
    foodDetail: const DutchPancake(),
    bookmark: false,
  ),

  //   FoodTypeModel(id:0, image: "assets/Burger.png", title: "Burger", time: "30", bookmark: false,),
  // FoodTypeModel(id:1, image: "assets/fruitToast.png", title: "Fruit Toast", time: "30", bookmark: false,),
  // FoodTypeModel(id:2, image: "assets/seafood.png", title: "Sea Food", time: "20", bookmark: false,),
  // FoodTypeModel(id:3, image: "assets/spicyPrawns.png", title: "Spicy Prawns", time: "30", bookmark: false,),
];
