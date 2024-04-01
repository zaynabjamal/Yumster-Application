import 'package:flutter/material.dart';
import 'package:flutter_application/chefs/chef_thomas.dart';
import 'package:flutter_application/custom%20classes/dot_list.dart';
import 'package:flutter_application/custom%20classes/recommend_card.dart';
import 'package:flutter_application/foodDetails/chefJohnsRecipeDetails/queso_dip_detauks.dart';
import 'package:flutter_application/foodDetails/dinner/chicken_pasta.dart';
import 'package:flutter_application/modules/food_data_module.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThaiRice extends StatefulWidget {
  const ThaiRice({super.key});

  @override
  State<ThaiRice> createState() => _FoodRecipeState();
}

class _FoodRecipeState extends State<ThaiRice> {
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
                image: AssetImage('assets/chickenFried.jpeg'),
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
                          'ThaiChickenRice',
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
                                  '55 mins',
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
                  DotList(text: '1 (4- to 5-pound) whole chicken'),
                  DotList(text: '4 medium scallions, halved crosswise'),
                  DotList(text: '1/4 cup cilantro stems,'),
                  DotList(text: '1 tablespoon plus 2 teaspoons kosher salt'),
                  DotList(text: '12 cups tap water'),
                  DotList(text: '2 1/2 cups uncooked jasmine rice'),
                  DotList(text: '1 tablespoon canola oil'),
                  DotList(text: '4 medium garlic cloves'),
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
                'Remove innards from chicken and discard. Pat chicken dry. With kitchen shears, trim off wings at the joint, leaving drumette on carcass. Trim off chicken tail, and snip off as much fat from cavity as you can. Place wings, tail, and trimmed fat in a small bowl; cover and refrigerate until ready to use. Place remaining chicken in a large (7-quart) saucepan or pot. Add scallions, sliced ginger,  cilantro stems, and 1 tablespoon of the salt. Cover chicken with the water and bring to a boil over medium-high. Once boiling, reduce heat to medium-low and simmer until chicken is cooked through, or an instant read thermometer registers 160°F when inserted in thickest portion of chicken, about 1 hour to 1 hour 15 minutes, skimming and discarding foam as it rises to the top during cooking. Remove chicken from broth and place on a rimmed baking sheet or plate; let cool while preparing rice. Strain solids from the broth and discard; leave broth in saucepan. Cover to keep broth warm. Place rice in a large bowl and cover with cold water. Agitate with your hand to release starch from rice. Drain and repeat until water is no longer cloudy, about 4 to 5 times. Strain rice and set aside. Heat 1 tablespoon of the oil in a wok or large skillet over medium heat. Add reserved chicken wings, tail, fat, and 1 teaspoon of the remaining salt and cook, stirring often, until fat has rendered and chicken wings and tail are golden brown and crispy, about 8 minutes. Once fat has rendered, reduce heat to low and add 4 teaspoons of the garlic and 1 tablespoon finely chopped ginger. Cook, stirring constantly, until fragrant and translucent, about 1 minute. Add rinsed rice and cook, stirring constantly, to coat all rice in rendered fat, about 1 minute. Remove from heat. Transfer rice mixture to an 8-cup rice cooker or a programmable pressure multicooker (such as an Instant Pot). Add 3 1/2 cups of the reserved broth and remaining 1 teaspoon salt;  cook rice according to manufacturer’s instructions (about 25 minutes for a rice cooker). When done cooking, remove and discard wings and tail, leaving remaining trimmed crispy chicken fat in the rice',
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
        // Suggestions Section
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
                  image: 'assets/CreamyLemonChickenPasta.jpg',
                  title: 'ChickenPasta',
                  time: '20min',
                  foodDetail: const ChickenPasta(),
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
