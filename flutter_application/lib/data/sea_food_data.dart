import 'package:flutter_application/foodDetails/seaFood/citrus_details.dart';
import 'package:flutter_application/foodDetails/seaFood/cod_details.dart';
import 'package:flutter_application/foodDetails/seaFood/salmon_details.dart';
import 'package:flutter_application/foodDetails/seaFood/tilapia_details.dart';
import 'package:flutter_application/modules/food_data_module.dart';

List<FoodTypeModel> seaFoodData = [
  FoodTypeModel(
    id: 0,
    image: "assets/salamonn.jpeg",
    title: "Salmon",
    time: "50min",
    foodDetail: const Salmon(),
    bookmark: false,
  ),
  FoodTypeModel(
    id: 0,
    image: "assets/Tilapia-Florentine.jpeg",
    title: "Tilapia Florentine ",
    time: "1hr",
    foodDetail: const Tilapia(),
    bookmark: false,
  ),
  FoodTypeModel(
    id: 0,
    image: "assets/Citrus.jpeg",
    title: "Citrus",
    time: "1hr",
    foodDetail: const Citrus(),
    bookmark: false,
  ),
  FoodTypeModel(
    id: 0,
    image: "assets/cod.jpeg",
    title: "Cod",
    time: "1hr",
    foodDetail: const Cod(),
    bookmark: false,
  ),

];
