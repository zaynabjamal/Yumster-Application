import 'package:flutter/material.dart';
import 'package:flutter_application/chefs/chef_thomas.dart';
import 'package:flutter_application/custom%20classes/dot_list.dart';
import 'package:flutter_application/custom%20classes/recommend_card.dart';
import 'package:flutter_application/foodDetails/chefJohnsRecipeDetails/chicken_curry_detail.dart';
import 'package:flutter_application/foodDetails/chefJohnsRecipeDetails/queso_dip_detauks.dart';
import 'package:flutter_application/modules/food_data_module.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Bread extends StatefulWidget {
  const Bread({super.key});

  @override
  State<Bread> createState() => _FoodRecipeState();
}

class _FoodRecipeState extends State<Bread> {
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
                image: AssetImage('assets/bread.jpeg'),
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
                          'Bread Pudding',
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
                                  '35 mins',
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
                  DotList(text: 'Deselect All '),
                  DotList(text: '5 extra-large whole eggs '),
                  DotList(text: '2 extra-large egg yolks'),
                  DotList(text: '2 1/2 cups half-and-half'),
                  DotList(text: '1/3 cup honey'),
                  DotList(text: '1 1/2 teaspoons pure vanilla extract'),
                  DotList(text: '2 teaspoons orange zest (2 oranges)'),
                  DotList(text: 'Brioche loaf'),
                  DotList(text: '1/2 cup golden raisins'),
                  DotList(text: 'Maple syrup, to serve'),
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
                'Preheat the oven to 350 degrees F In a medium bowl, whisk together the whole eggs, egg yolks, half-and-half, honey, vanilla, orange zest, and salt. Set aside. Slice the brioche loaf into 6 (1-inch) thick pieces. Lay half brioche slices flat in a 9 by 14 by 2-inch oval baking dish. Spread the raisins on top of the brioche slices, and place the remaining slices on top. Make sure that the raisins are between the layers of brioche or they will burn while baking. Pour the egg mixture over the bread and allow to soak for 15 minutes, pressing down gently. Bake for 55 to 60 minutes or until the pudding puffs up and the custard is set. Remove from the oven and cool slightly before serving.',
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
                builder: (context) => const ChefThomasAcc(
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
                    backgroundImage: AssetImage('assets/thomas.jpeg'),
                    radius: 20.0,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Chef Thomas',
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
