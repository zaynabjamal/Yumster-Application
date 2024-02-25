import 'package:flutter/material.dart';
import 'package:flutter_application/cheifPage/chef.dart';
import 'package:flutter_svg/flutter_svg.dart';


void main() {
  runApp(FoodRecipe());
}

class FoodRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading:const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(254, 152, 1, 1.0),
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // Food Image
            Container(
              margin: EdgeInsets.all(15.0),
              height: 250.0,
              width: 150.0,
              decoration: BoxDecoration(
                  borderRadius:const BorderRadius.all(Radius.circular(12.0)),
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/food1.jpg'), // Replace with your image
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset:const Offset(0, 2),
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
                        padding:const EdgeInsets.all(8.0),
                        child:const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Food Name',
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
                                      Icons.timer,
                                      size: 20.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 4.0),
                                    Text(
                                      '30 mins',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
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
                const  Icon(
                    Icons.bookmark,
                    color: Colors.white,
                    size: 40.0,
                  ),
                ],
              ),
            ),
            // Recipe Details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                  const  Padding(padding: EdgeInsets.all(10.0)),
                    // SVG Image
                    Container(
                      child: SvgPicture.asset(
                        'assets/recip.svg',
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                    Container(
                      child:const Text(
                        "Recipe",
                        style: TextStyle(
                          color: Color.fromRGBO(254, 152, 1, 1.0),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding:const EdgeInsets.all(25.0),
                  color: Colors.white,
                  // Text Content
                  child:const Text(
                    'Recipe details go here. Lorem ipsum dolor sit amet, consectetur \n '
                    'adipiRecipe details go here. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt utRecipe details go here. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt utscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromRGBO(176, 170, 134, 1.0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
           const SizedBox(height: 8.0),
            // Chef Details
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => chefaccount(),
                  ),
                );
              },
              child: Container(
                margin:const EdgeInsets.all(20.0),
                padding:const EdgeInsets.all(5.0),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    color:const Color.fromRGBO(255, 244, 229, 1.0),
                    borderRadius:const BorderRadius.all(Radius.circular(15.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:const Offset(0, 2),
                      )
                    ]),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color.fromRGBO(254, 152, 1, 1.0),
                          width: 1.0,
                        ),
                      ),
                      child:const CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/chef1.jpg'), // Replace with chef's image
                        radius: 35.0,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                   const Text(
                      'Chef Name',
                      style: TextStyle(
                          color: Color.fromRGBO(254, 152, 1, 1.0),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            // Suggestions Section
            Container(
              margin:const EdgeInsets.all(20),
              child:const Text(
                "Reccomend",
                style: TextStyle(
                    fontSize: 28,
                    color: Color.fromRGBO(105, 124, 55, 1.0),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 180.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildSuggestionCard('assets/food2.jpg', '15 mins', 'Pasta'),
                  buildSuggestionCard('assets/food3.jpg', '20 mins', 'Salad'),
                  buildSuggestionCard('assets/food4.jpg', '25 mins', 'Pizza'),
                  buildSuggestionCard('assets/food1.jpg', '18 mins', 'Sushi'),
                  buildSuggestionCard('assets/food1.jpg', '22 mins', 'Burger'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSuggestionCard(String imagePath, String time, String foodName) {
    return Container(
      width: 180.0,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding:const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 70,
                      height: 30,
                      decoration:const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        color: Color.fromRGBO(105, 124, 55, 1.0),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: Colors.white,
                            size: 10,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            time,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 35,
            decoration: BoxDecoration(
              borderRadius:const BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              color: const Color.fromRGBO(255, 244, 229, 1.0).withOpacity(1.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:const EdgeInsets.all(8.0),
                  child: Text(
                    foodName,
                    style:const TextStyle(
                      color: Color.fromRGBO(105, 124, 55, 1.0),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
               const Icon(
                  Icons.bookmark,
                  color: Color.fromRGBO(254, 152, 1, 1.0),
                  size: 20.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
