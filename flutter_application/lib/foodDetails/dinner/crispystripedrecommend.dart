import 'package:flutter/material.dart';
import 'package:flutter_application/custom%20classes/dot_list.dart';
import 'package:flutter_application/modules/food_data_module.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CrispyReccommend extends StatefulWidget {
  const CrispyReccommend({super.key});

  @override
  State<CrispyReccommend> createState() => _CrispyReccommendState();
}

class _CrispyReccommendState extends State<CrispyReccommend> {
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
                    image: AssetImage('assets/chefJohnRecipe2.webp'),
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
                              'Chicken Curry',
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
                      DotList(text: '6 oz. soba noodles'),
                      DotList(text: '8 oz. sugar snap peas, ends trimmed'),
                      DotList(
                          text: '1/2 tsp. orange zest,3/4 cup orange juice'),
                      DotList(text: '3 tbsp. rice vinegar'),
                      DotList(text: '3/4 tsp. grated peeled fresh ginger'),
                      DotList(text: 'Kosher salt and pepper'),
                      DotList(
                          text: '1 small shallot, thinly sliced into rounds'),
                      DotList(text: '1 tbsp. olive oil'),
                      DotList(
                          text: '4 6-oz pieces skin-on striped bass fillet'),
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
                    'A bright, ginger-orange vinaigrette is the ideal accompaniment to earthy soba, tender-crisp snap peas, and flaky, crispy-skinned fish.',
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