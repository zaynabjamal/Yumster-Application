import 'package:flutter/material.dart';
import 'package:flutter_application/foodDetails/chefJohnsRecipeDetails/ping_details.dart';
import 'package:flutter_application/custom%20classes/recommend_card.dart';
import 'package:flutter_application/foodDetails/chefJohnsRecipeDetails/sweet_potato_details.dart';
import 'package:flutter_application/foodDetails/chefThomasRecipeDetails/ciabatta_details.dart';
import 'package:flutter_application/modules/food_data_module.dart';
import 'package:flutter_svg/svg.dart';

class ChefJohn {
  final String name;
  final String photoAsset;

  ChefJohn({required this.name, required this.photoAsset});
}

class Food {
  final String name;
  final String time;
  final String imageAsset;
  final Widget detail;

  Food({
    required this.name,
    required this.time,
    required this.imageAsset,
    required this.detail,
  });
}

class ChefThomasAcc extends StatelessWidget {
  const ChefThomasAcc({super.key, required this.foodTypes});
  final List<FoodTypeModel> foodTypes;

  @override
  Widget build(BuildContext context) {
    return FoodGridScreen(
      chef: ChefJohn(
        //change
        name: 'Chef Thomas',
        photoAsset: 'assets/thomas.jpeg',
      ),
      foods: [
        Food(
            name: 'Ciabatta',
            time: '40min',
            imageAsset: 'assets/thomasrecipe2.webp',
            detail: const Ciabata()),
        Food(
            name: 'Sweet Potato',
            time: '50min',
            imageAsset: 'assets/thomasrecipe3.webp',
            detail: const SweetPotato()),
        Food(
            name: 'Ping Gai',
            time: '45min',
            imageAsset: 'assets/ chefJohnrecipy3.webp',
            detail: const Ping()),
      ],
    );
  }
}

class FoodGridScreen extends StatelessWidget {
  final ChefJohn chef;
  final List<Food> foods;

  const FoodGridScreen({super.key, required this.chef, required this.foods});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFCF8),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset("assets/arrowBack.svg")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromRGBO(254, 152, 1, 1.0),
                width: 3.0,
              ),
            ),
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(chef.photoAsset),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            chef.name,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(105, 124, 55, 1.0)),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0,
              ),
              itemCount: foods.length,
              itemBuilder: (context, index) {
                return GridTile(
                  child: RecommendCard(
                    foodType: FoodTypeModel(
                      id: 1,
                      image: foods[index].imageAsset,
                      title: foods[index].name,
                      time: foods[index].time,
                      foodDetail: foods[index].detail,
                      bookmark: false,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
