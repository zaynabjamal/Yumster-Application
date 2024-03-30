import 'package:flutter_application/foodDetails/foodrecipe.dart';
import 'package:flutter_application/modules/food_data_module.dart';

List<FoodTypeModel> foodTypeData = [
  FoodTypeModel(
    id: 0,
    image: "assets/Burger.png",
    title: "Burger",
    time: "30min",
    foodDetail: const FoodRecipe(),
    bookmark: false,
  ),
  FoodTypeModel(
    id: 1,
    image: "assets/fruitToast.png",
    title: "Fruit Toast",
    time: "30min",
    foodDetail: const FoodRecipe(),
    bookmark: false,
  ),
  FoodTypeModel(
    id: 2,
    image: "assets/seafood.png",
    title: "Sea Food",
    time: "20min",
    foodDetail: const FoodRecipe(),
    bookmark: false,
  ),
  FoodTypeModel(
    id: 3,
    image: "assets/spicyPrawns.png",
    title: "Spicy Prawns",
    time: "30min",
    foodDetail: const FoodRecipe(),
    bookmark: false,
  ),

  //   FoodTypeModel(id:0, image: "assets/Burger.png", title: "Burger", time: "30", bookmark: false,),
  // FoodTypeModel(id:1, image: "assets/fruitToast.png", title: "Fruit Toast", time: "30", bookmark: false,),
  // FoodTypeModel(id:2, image: "assets/seafood.png", title: "Sea Food", time: "20", bookmark: false,),
  // FoodTypeModel(id:3, image: "assets/spicyPrawns.png", title: "Spicy Prawns", time: "30", bookmark: false,),
];
