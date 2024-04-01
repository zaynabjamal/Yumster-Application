import 'package:flutter/material.dart';
import 'package:flutter_application/custom%20classes/dot_list.dart';
import 'package:flutter_application/modules/food_data_module.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Ciabata extends StatefulWidget {
  const Ciabata({super.key});

  @override
  State<Ciabata> createState() => _FoodRecipeState();
}

class _FoodRecipeState extends State<Ciabata> {
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
                    image: AssetImage('assets/thomasrecipe2.webp'),
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
                              'Ciabata',
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
                                      '40 mins',
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
                      DotList(text: '3 tbsp. unsalted butter'),
                      DotList(text: '10 oz. bulk sweet sausage '),
                      DotList(text: '1 carrot, cut into 1/4" dice'),
                      DotList(text: '1 small yellow onion'),
                      DotList(text: '1 stalk celery'),
                      DotList(text: '2 cups turkey or chicken stock'),
                      DotList(text: '1⁄3 cup olive oil'),
                      DotList(text: '2 tbsp. roughly chopped parsley'),
                      DotList(text: '2 tbsp. roughly chopped rosemary'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.sizeOf(context).width * 0.03,
                      horizontal: MediaQuery.sizeOf(context).width * 0.05),
                  color: const Color(0xffFCFCF8),
                  child: const Text(
                    'Heat oven to 375°. Melt 1 tbsp. butter in a 12" skillet over medium-high. Cook sausage, stirring and breaking up meat into medium pieces, until browned, 8–10 minutes. Transfer sausage to a large bowl; set aside. Add remaining butter to skillet; cook carrot, onion, and celery until soft, 5–7 minutes, and transfer to bowl with sausage. Add stock, oil, parsley, rosemary, sage, bread, salt, and pepper to bowl; toss to combine. Spread evenly in a 9" x 13" baking dish. Bake until golden brown and bread is slightly crisp on top, 30–35 minutes. Garnish with more parsley, if you like.',
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
        ));
  }
}
