import 'package:flutter_application/foodDetails/dinner/chicken_pasta.dart';
import 'package:flutter_application/foodDetails/dinner/crispy_striped.dart';
import 'package:flutter_application/foodDetails/dinner/pasta_puttanesca.dart';
import 'package:flutter_application/foodDetails/dinner/rice_porridge.dart';
import 'package:flutter_application/modules/food_data_module.dart';

List<FoodTypeModel> dinnerData = [
  FoodTypeModel(
    id: 0,
    image: "assets/crispystripedbasswithcitrussoba.jpg",
    title: "Crispy Striped",
    time: "30min",
    foodDetail: const CrispyStriped(),
    bookmark: false,
  ),
  FoodTypeModel(
    id: 1,
    image: "assets/CreamyLemonChickenPasta.jpg",
    title: "Chicken Pasta",
    time: "30min",
    foodDetail: const ChickenPasta(),
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
    image: "assets/VeganCongeeRecipe.jpg",
    title: "Rice Porridge",
    time: "40min",
    foodDetail: const RicePorridge(),
    bookmark: false,
  ),
];
