
import 'package:flutter/material.dart';
import 'foodrecipe.dart';

void main() {
  runApp(chefaccount());
}

class Chef {
  final String name;
  final String photoAsset;

  Chef({required this.name, required this.photoAsset});
}

class Food {
  final String name;
  final String type;
  final String time;
  final String imageAsset;

  Food({
    required this.name,
    required this.type,
    required this.time,
    required this.imageAsset,
  });
}

class chefaccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FoodGridScreen(
        chef: Chef(
          name: 'Chef John',
          photoAsset: 'assets/chef1.jpg',
        ),
        foods: [
          Food(
            name: 'Pasta Carbonara',
            type: 'breakfast',
            time: '30 mins',
            imageAsset: 'assets/food2.jpg',
          ),
          Food(
            name: 'Chicken Stir Fry',
            type: 'lunch',
            time: '25 mins',
            imageAsset: 'assets/food1.jpg',
          ),
          Food(
            name: 'Caesar Salad',
            type: 'luanch',
            time: '15 mins',
            imageAsset: 'assets/food3.jpg',
          ),
          Food(
            name: 'Chocolate Cake',
            type: 'breakfast',
            time: '40 mins',
            imageAsset: 'assets/food4.jpg',
          ),
          Food(
            name: 'Chocolate Cake',
            type: 'lunch',
            time: '40 mins',
            imageAsset: 'assets/food1.jpg',
          ),
          Food(
            name: 'Chocolate Cake',
            type: 'lunch',
            time: '40 mins',
            imageAsset: 'assets/food3.jpg',
          ),
          Food(
            name: 'Chocolate Cake',
            type: 'lunch',
            time: '40 mins',
            imageAsset: 'assets/food2.jpg',
          ),
          Food(
            name: 'Chocolate Cake',
            type: 'lunch',
            time: '40 mins',
            imageAsset: 'assets/food4.jpg',
          ),
        ],
      ),
    );
  }
}

class FoodGridScreen extends StatelessWidget {
  final Chef chef;
  final List<Food> foods;

  FoodGridScreen({required this.chef, required this.foods});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(254, 152, 1, 1.0),
          ),
          onPressed: () {
            // Use Navigator to navigate to the recipe screen
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FoodRecipe(),
              ),
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color.fromRGBO(254, 152, 1, 1.0),
                width: 3.0,
              ),
            ),
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(chef.photoAsset),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            chef.name,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(105, 124, 55, 1.0)),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: foods.length,
              itemBuilder: (context, index) {
                return GridTile(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage(foods[index].imageAsset),
                        opacity: 0.6,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          const  Padding(
                                padding: EdgeInsets.only(top: 50, left: 15)),
                            Container(
                              width: 90,
                              height: 35,
                              decoration:const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                color: Color.fromRGBO(105, 124, 55, 1.0),
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.access_time,
                                      color: Colors.white),
                                  const SizedBox(width: 5),
                                  Text(
                                    foods[index].time,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius:const BorderRadius.only(
                              bottomLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                            ),
                            color: const Color.fromRGBO(255, 244, 229, 1.0)
                                .withOpacity(1.0),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                foods[index].type,
                                style: const TextStyle(
                                  color: Color.fromRGBO(105, 124, 55, 1.0),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Icon(
                                Icons.bookmark,
                                color: Color.fromRGBO(254, 152, 1, 1.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
