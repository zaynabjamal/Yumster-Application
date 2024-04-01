import 'package:flutter/material.dart';
import 'package:flutter_application/custom%20classes/dot_list.dart';
import 'package:flutter_application/modules/food_data_module.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuesoDip extends StatefulWidget {
  const QuesoDip({super.key});

  @override
  State<QuesoDip> createState() => _FoodRecipeState();
}

class _FoodRecipeState extends State<QuesoDip> {
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
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
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
                  image: AssetImage('assets/chefJohnRecipe1.webp'),
                  opacity: 0.5,
                  fit: BoxFit.fill,
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
                            'Queso Dip',
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
                                    '20 mins',
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
                    DotList(text: '2 tbsp. olive oil '),
                    DotList(text: '1 yellow onion, finely chopped '),
                    DotList(text: '1 clove garlic, finely chopped  '),
                    DotList(text: '1 tsp. ground cumin '),
                    DotList(text: 'Kosher salt and pepper '),
                    DotList(text: '1 lb. tomatoes, halved if large'),
                    DotList(text: '8 large eggs'),
                    DotList(text: '1/4 c. baby spinach, finely chopped'),
                    DotList(text: 'Toasted baguette, for serving'),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.sizeOf(context).width * 0.03,
                    horizontal: MediaQuery.sizeOf(context).width * 0.05),
                color: const Color(0xffFCFCF8),
                child: const Text(
                  'Step1 Heat oven to 400°F. Heat oil in large oven-safe skillet on medium. Add onion and sauté until golden brown and tender, 8 minutes. Stir in garlic, cumin and ½ teaspoon each salt and pepper and cook 1 minute. Stir in tomatoes, transfer to oven and roast 10 minutes. Step2 Remove pan from oven, stir, then make 8 small wells in vegetable mixture and carefully crack 1 egg into each. Bake eggs to desired doneness, 7 to 8 minutes for slightly runny yolks. Sprinkle with spinach and, if desired, serve with toast.',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xffB0AA86),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
