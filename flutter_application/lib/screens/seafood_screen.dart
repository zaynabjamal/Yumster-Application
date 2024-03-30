import 'package:flutter/material.dart';
import 'package:flutter_application/data/sea_food_data.dart';
import 'package:flutter_application/screens/home/home_screen.dart';
import 'package:flutter_application/modules/food_data_module.dart';
import 'package:flutter_application/provider/bookmark.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Sea extends StatefulWidget {
  const Sea({super.key});

  @override
  State<Sea> createState() => _OthersState();
}

class _OthersState extends State<Sea> {
  late List<FoodTypeModel> shuffledFoodTypeData;
  @override
  void initState() {
    super.initState();
    shuffledFoodTypeData = List.from(seaFoodData);
    //shuffledFoodTypeData.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookmarkProvider>(context,
        listen: true); //contexte buildContext
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFCFCF8),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              icon: SvgPicture.asset("assets/arrowBack.svg")),
          centerTitle: true,
          title: const Text(
            'SeaFood',
            style: TextStyle(
              color: Color(0xffFE9801),
              fontSize: 32,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            shuffledFoodTypeData.length,
            (index) {
              FoodTypeModel foodTypeModel = shuffledFoodTypeData[index];
              Widget food = shuffledFoodTypeData[index].foodDetail;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    color: const Color(0xffFFF4E5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => food),
                          );
                        },
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 140,
                              width: 200,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4)),
                                child: Image.asset(
                                  shuffledFoodTypeData[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              left: 4,
                              child: Container(
                                width: 50,
                                height: 12,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF697C37),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.access_time,
                                        color: Color(0xFFFFF4E5),
                                        size: 9,
                                      ),
                                      const Gap(4),
                                      Text(
                                        shuffledFoodTypeData[index].time,
                                        style: const TextStyle(
                                          fontSize: 8,
                                          color: Color(0xFFFFF4E5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Text(
                              shuffledFoodTypeData[index].title,
                              style: const TextStyle(
                                color: Color(0xFF697C37),
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  foodTypeModel.toggleBookmarkRandomly();
                                  provider.addItems(foodTypeModel);

                                  print(
                                      "${shuffledFoodTypeData[index]} this is id");
                                });
                              },
                              child: Container(
                                child: provider.isExist(foodTypeModel)
                                    ? const Icon(
                                        Icons.bookmark,
                                        color: Color(0xFFFE9801),
                                      )
                                    : const Icon(
                                        Icons.bookmark_border,
                                        color: Color(0xFFFE9801),
                                      ),
                              ),
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
      ),
    );
  }
}
