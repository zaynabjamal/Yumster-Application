import 'package:flutter/material.dart';
import 'package:flutter_application/chefs/chef_thomas.dart';
import 'package:flutter_application/custom%20classes/dot_list.dart';
import 'package:flutter_application/custom%20classes/recommend_card.dart';
import 'package:flutter_application/foodDetails/chefJohnsRecipeDetails/chicken_curry_detail.dart';
import 'package:flutter_application/foodDetails/chefJohnsRecipeDetails/queso_dip_detauks.dart';
import 'package:flutter_application/modules/food_data_module.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClayRice extends StatefulWidget {
  const ClayRice({super.key});

  @override
  State<ClayRice> createState() => _FoodRecipeState();
}

class _FoodRecipeState extends State<ClayRice> {
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
                image: AssetImage('assets/clay-pot-rice-26.webp'),
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
                          'Clay Rice',
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
                                  '50 min',
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
                  DotList(text: '1 cup short-grain rice (7 ounces)'),
                  DotList(text: '3 ounces mixed mushrooms'),
                  DotList(text: '2 scallions, coarsely chopped'),
                  DotList(text: '1 teaspoon low-sodium soy sauce'),
                  DotList(text: 'Salt and freshly ground pepper'),
                  DotList(text: '2 thick slices of fatty bacon'),
                  DotList(text: '2 garlic cloves, minced'),
                  DotList(text: '2 teaspoons minced fresh ginger'),
                  DotList(text: '1/2 cup ginkgo nuts'),
                  DotList(text: '1 cup water'),
                  DotList(text: '1 tablespoon vegetable oil'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.sizeOf(context).width * 0.03,
                  horizontal: MediaQuery.sizeOf(context).width * 0.05),
              color: const Color(0xffFCFCF8),
              child: const Text(
                'In a bowl, cover the rice with water and let soak until the grains turn white, about 1 hour. Drain the rice. In another bowl, toss the mushrooms and scallions with 1 tablespoon of the soy sauce and season with salt and pepper; let marinate for 10 minutes. In a small, enameled cast-iron casserole, clay pot or medium saucepan, cook the bacon over moderate heat until the fat is rendered and the bacon is crisp, about 5 minutes. Add the garlic and ginger and cook, stirring, until fragrant, about 1 minute. Add the soaked rice and stir to coat with the fat. Add the ginkgo nuts, marinated mushrooms and scallions, the water and the remaining 1 teaspoon of soy sauce. Bring to a boil over moderately high heat. Drizzle the oil around the edge of the pot so it runs down the insides. Cover the pot and cook the rice over low heat until tender and the liquid has been absorbed, 10 minutes. Raise the heat to high and cook the rice, covered, until sizzling and a crust forms on the bottom, about 5 minutes. Remove the pot from the heat and let stand, covered, for 5 minutes. Fluff the rice with a fork and serve.',
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
