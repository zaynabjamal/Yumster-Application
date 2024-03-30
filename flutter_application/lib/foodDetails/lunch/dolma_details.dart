import 'package:flutter/material.dart';
import 'package:flutter_application/chefs/chef_john.dart';
import 'package:flutter_application/custom%20classes/dot_list.dart';
import 'package:flutter_application/custom%20classes/recommend_card.dart';
import 'package:flutter_application/foodDetails/chefJohnsRecipeDetails/chicken_curry_detail.dart';
import 'package:flutter_application/foodDetails/chefJohnsRecipeDetails/queso_dip_detauks.dart';
import 'package:flutter_application/modules/food_data_module.dart';
import 'package:flutter_application/screens/lunch_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dolma extends StatefulWidget {
  const Dolma({super.key});

  @override
  State<Dolma> createState() => _FoodRecipeState();
}

class _FoodRecipeState extends State<Dolma> {
  late final List<FoodTypeModel> foodtype;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFCF8),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Lunch()));
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
                image: AssetImage('assets/dolma.jpeg'),
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
                          'Dollma',
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
        // Recipe Details
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Padding(padding: EdgeInsets.all(10.0)),
                // change
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
                  DotList(text: '1 tablespoon olive oil'),
                  DotList(text: '2 onions, minced'),
                  DotList(text: '1 ½ cups uncooked white rice'),
                  DotList(text: '1 1/2 cups hot water'),
                  DotList(text: '2 tablespoons tomato paste'),
                  DotList(text: '2 tablespoons dried currants'),
                  DotList(text: '2 tablespoons pine nuts'),
                  DotList(text: '1 tablespoon ground cinnamon'),
                  DotList(text: '1 tablespoon dried mint'),
                  DotList(text: '1 tablespoon dried dill weed'),
                  DotList(text: '1 teaspoon ground allspice'),
                  DotList(text: '1 teaspoon ground cumin'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.sizeOf(context).width * 0.03,
                  horizontal: MediaQuery.sizeOf(context).width * 0.05),
              color: const Color(0xffFCFCF8),
              // change
              child: const Text(
                '1 Heat oil in a medium saucepan over medium heat. Add onions and sauté until tender, about 5 minutes. Stir in rice, then add enough hot water to cover. Cover and simmer until rice is halfway cooked, about 10 minutes. Step2 1 Remove from the heat and stir in tomato paste, currants, pine nuts, cinnamon, mint, dill, allspice, and cumin. Let mixture cool, about 15 minutes.   2 Prepare a large pot by placing an inverted plate on the bottom; this will protect the dolmas from direct heat during steaming.   3 Cut off and discard any grape leaf stems. Place about 1 teaspoon cooled rice mixture into the center of a leaf. Fold in the sides, then roll into a cigar shape. Place into the prepared pot. Repeat to make remaining dolmas.   4 Pour in just enough warm water to reach the bottom of the first layer of dolmas. Cover and simmer over low heat for 30 to 45 minutes, or until rice is totally cooked. Check the water level often and add more as necessary.',
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
        // Chef Details
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
        // Suggestions Section
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).width * 0.0,
              horizontal: MediaQuery.sizeOf(context).width * 0.05),
          child: const Text(
            "Reccomend",
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
              //have to change it here for each food recipe
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
