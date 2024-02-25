import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Others extends StatefulWidget {
  const Others({super.key});

  @override
  State<Others> createState() => _OthersState();
}

class _OthersState extends State<Others> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFCF8),
      appBar: AppBar(
        backgroundColor: const Color(0xffFCFCF8),
        title: const Text(
          'Others',
          style: TextStyle(
            color: Color(0xffFE9801),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //const Gap(32),
            /*Row(
              children: [
                const Gap(32),
                SvgPicture.asset("assets/ArrowBackVector.svg"),
                const Gap(100),
                const Text(
                  "others",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'ConcertOne',
                      color: Color(0xFFFE9801)),
                )
              ],
            ),*/
            //const Gap(42),
            Padding(
              padding: const EdgeInsets.only(left: 30.5, right: 30.5),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFF4E5),
                    prefixIcon: const SizedBox(
                      width: 69,
                      child: Icon(Icons.search, size: 40,)
                      /*SvgPicture.asset(
                        'assets/search-normal.svg',
                        
                        width: 20,
                        height: 20,
                      ),*/
                    ),
                    hintText: "Search",
                    hintStyle: const TextStyle(
                      color: Color(0xFFB0AA86),
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Rowdies',
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(31),
                    )),
              ),
            ),
            const Gap(40),
            Row(
              children: [
                const Gap(40),
                containerFoods(
                  image: "assets/Burger.png",
                  time: "30 min",
                  foodType: "Chesse Burger",
                ),
                const Gap(20),
                containerFoods(
                  image: "assets/spicyPrawns.png",
                  time: "30 min",
                  foodType: "Spicy Prawns",
                ),
              ],
            ),
            const Gap(20),
            Row(
              children: [
                const Gap(40),
                containerFoods(
                  image: "assets/fruitToast.png",
                  time: "30 min",
                  foodType: "Fruit Toast",
                ),
                const Gap(20),
                containerFoods(
                    image: "assets/Burger.png",
                    time: "30 min",
                    foodType: "Chesse Burger"),
              ],
            ),
            const Gap(20),
            Row(
              children: [
                const Gap(40),
                containerFoods(
                    image: "assets/Burger.png",
                    time: "30 min",
                    foodType: "Chesse Burger"),
                const Gap(20),
                containerFoods(
                    image: "assets/spicyPrawns.png",
                    time: "30 min",
                    foodType: "Spicy Prawns")
              ],
            ),
            const Gap(20),
            Row(
              children: [
                const Gap(40),
                containerFoods(
                    image: "assets/fruitToast.png",
                    time: "30 min",
                    foodType: "Fruit Toast"),
                const Gap(20),
                containerFoods(
                    image: "assets/Burger.png",
                    time: "30 min",
                    foodType: "Chesse Burger"),
              ],
            ),
            const Gap(20),
            Row(
              children: [
                const Gap(40),
                containerFoods(
                    image: "assets/Burger.png",
                    time: "30 min",
                    foodType: "Chesse Burger"),
                const Gap(20),
                containerFoods(
                    image: "assets/spicyPrawns.png",
                    time: "30 min",
                    foodType: "Spicy Prawns")
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget containerFoods({
  required String image,
  required String time,
  required String foodType,
}) {
  return Container(
    width: 154,
    height: 130,
    decoration: const BoxDecoration(
      color: Color(0xFFFFF4E5),
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    child: Stack(
      children: [
        Image.asset(image),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 95, top: 3),
              child: Container(
                width: 50,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color(0xFF697C37),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Color(0xFFFFF4E5),
                        size: 9,
                      ),
                      const Gap(5),
                      Text(
                        time,
                        style: const TextStyle(
                            fontSize: 8, color: Color(0xFFFFF4E5)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(85),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Gap(5),
                Text(
                  foodType,
                  style: const TextStyle(
                    color: Color(0xFF697C37),
                    fontFamily: 'Rowdies',
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const Gap(15),
                const Icon(
                  Icons.bookmark_border,
                  color: Color(0xFFFE9801),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
