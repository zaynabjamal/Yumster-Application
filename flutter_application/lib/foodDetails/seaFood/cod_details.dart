import 'package:flutter/material.dart';
import 'package:flutter_application/chefs/chef_john.dart';
import 'package:flutter_application/custom%20classes/dot_list.dart';
import 'package:flutter_application/custom%20classes/recommend_card.dart';
import 'package:flutter_application/foodDetails/chefJohnsRecipeDetails/chicken_curry_detail.dart';
import 'package:flutter_application/foodDetails/chefJohnsRecipeDetails/queso_dip_detauks.dart';
import 'package:flutter_application/modules/food_data_module.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Cod extends StatefulWidget {
  const Cod({super.key});

  @override
  State<Cod> createState() => _FoodRecipeState();
}

class _FoodRecipeState extends State<Cod> {
  late final List<FoodTypeModel> foodtype;

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
      body: ListView(scrollDirection: Axis.vertical, children: [
        Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).width * 0.03,
              horizontal: MediaQuery.sizeOf(context).width * 0.04),
          height: 262.0,
          width: 327,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: Colors.black,
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black87,
                  Colors.black,
                ],
              ),
              image: const DecorationImage(
                image: AssetImage('assets/cod.jpeg'),
                opacity: 0.5,
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 2),
                )
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cod',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.timer_sharp,
                                  size: 12,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  '1hr',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.bookmark_border_outlined,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Padding(padding: EdgeInsets.all(10.0)),
                SvgPicture.asset(
                  'assets/recip.svg',
                  width: 40.0,
                  height: 40.0,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Recipe",
                  style: TextStyle(
                    color: Color(0xffFE9801),
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.sizeOf(context).width * 0.03,
                  horizontal: MediaQuery.sizeOf(context).width * 0.05),
              color: const Color(0xffFCFCF8),
              child: const Column(
                children: [
                  DotList(text: '2 cod fillets (6 ounces each)'),
                  DotList(text: '1/2 teaspoon salt'),
                  DotList(text: '1/4 teaspoon pepper'),
                  DotList(text: '3 tablespoons olive oil, divided'),
                  DotList(text: '1/2 large sweet onion, thinly sliced'),
                  DotList(text: '1/2 cup dry white wine'),
                  DotList(text: '1/4 cup cilantro'),
                  DotList(text: '1 tablespoon sliced almonds'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.sizeOf(context).width * 0.03,
                  horizontal: MediaQuery.sizeOf(context).width * 0.05),
              color: const Color(0xffFCFCF8),
              child: const Text(
                'Pat cod dry with paper towels; sprinkle with salt and pepper. In a large nonstick skillet, heat 2 tablespoons oil over medium-high heat. Brown fillets lightly on both sides; remove from pan. In same skillet, heat remaining 1 tablespoon oil over medium heat. Add onion; cook and stir until softened, 4-5 minutes. Stir in wine; cook until onion is lightly browned, stirring occasionally, 3-4 minutes longer. Return cod to pan. Reduce heat to low; cook, covered, until fish just begins to flake easily with a fork, 2-3 minutes. Remove cod from pan. Stir cilantro and pine nuts into onion; serve with fish.',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xffB0AA86),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 0.0),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChefJohnAcc(
                  foodTypes: [],
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(9.0),
            width: 70,
            height: 60,
            decoration: const BoxDecoration(
              color: Color(0xFFFFF4E5),
              borderRadius: BorderRadius.all(Radius.circular(4)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 1),
                    blurRadius: 1,
                    spreadRadius: 0),
              ],
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xffFE9801),
                      width: 1.0,
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/chefJohn.jpeg'),
                    radius: 20.0,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Chef John',
                  style: TextStyle(
                      color: Color(0xffFE9801),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).width * 0.0,
              horizontal: MediaQuery.sizeOf(context).width * 0.05),
          child: const Text(
            "Recommend",
            style: TextStyle(
                fontSize: 24,
                color: Color(0xff697C37),
                fontWeight: FontWeight.w400),
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.015,
              vertical: MediaQuery.sizeOf(context).width * 0.002),
          height: MediaQuery.sizeOf(context).width * 0.5,
          width: MediaQuery.sizeOf(context).width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              RecommendCard(
                foodType: FoodTypeModel(
                  id: 0,
                  image: 'assets/chefJohnRecipe1.webp',
                  title: 'Queso Dip',
                  time: '20min',
                  foodDetail: const QuesoDip(),
                  bookmark: false,
                ),
              ),
              RecommendCard(
                foodType: FoodTypeModel(
                  id: 1,
                  image: 'assets/chefJohnRecipe2.webp',
                  title: 'Chicken Curry',
                  time: '40min',
                  foodDetail: const ChickenCurry(),
                  bookmark: false,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
