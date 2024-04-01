import 'package:flutter/material.dart';
import 'package:flutter_application/custom%20classes/dot_list.dart';
import 'package:flutter_application/modules/food_data_module.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dumpling extends StatefulWidget {
  const Dumpling({super.key});

  @override
  State<Dumpling> createState() => _FoodRecipeState();
}

class _FoodRecipeState extends State<Dumpling> {
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
                    image: AssetImage('assets/thomas4recipe.webp'),
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
                              'Dumpling',
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
                                      '45 mins',
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
                      DotList(text: '2½ lb. snapper or tilapia heads'),
                      DotList(text: 'Kosher salt'),
                      DotList(text: '3 garlic cloves'),
                      DotList(text: '2 bay leaves'),
                      DotList(text: '2 large yellow onions'),
                      DotList(text: '2 dried guajillo chiles'),
                      DotList(text: '2 Tbsp. dried oregano'),
                      DotList(text: '1 Tbsp. (¾ oz.) achiote paste'),
                      DotList(text: '1 Tbsp. avocado or vegetable oil'),
                      DotList(text: 'Juice of 3 limes'),
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
                    'STEP 1 Make the broth: Place the fish heads, tails, and bones in a bowl of cold water and soak for 10 minutes. Drain and discard water. STEP 2 To a large pot over high heat, add the fish scraps, 2 garlic cloves, the bay leaves, and 4 quarts of cold water, and bring to a boil. Meanwhile, to a comal or skillet over high heat, add the halved onion, cut-side-down, and cook until browned, 6 minutes. Add to the pot, then turn the heat to low and simmer, skimming occasionally, until the fish bones are soft and the meat has separated from the heads and tails, about 1 hour.',
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
