import 'package:flutter/material.dart';
import 'package:flutter_application/cheifPage/foodrecipe.dart';
import 'package:flutter_application/data/food_type_data.dart';
import 'package:flutter_application/home/home_screen.dart';
import 'package:flutter_application/modules/food_type.dart';
import 'package:flutter_application/provider/bookmark.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Others extends StatefulWidget {
  const Others({super.key});

  @override
  State<Others> createState() => _OthersState();
}

class _OthersState extends State<Others> {
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
            'Others',
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
            foodTypeData.length,
            (index) {
              FoodTypeModel foodTypeModel = foodTypeData[index];
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
                                builder: (context) => const FoodRecipe()),
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
                                  foodTypeData[index].image,
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
                                        '${foodTypeData[index].time}min',
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
                              foodTypeData[index].title,
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
                                  foodTypeData[index].bookmark =
                                      !foodTypeData[index].bookmark;
                                  if (!foodTypeData[index].bookmark) {
                                    provider.removeItem(foodTypeModel);
                                  }
                                  provider.addItems(foodTypeModel);
                                  print("item added to provider!!");
                                  print("${foodTypeData[index].id} this is id");
                                });
                              },
                              child: Container(
                                child: foodTypeData[index].bookmark
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
        // Column(
        //   children: [
        //     Gap(MediaQuery.sizeOf(context).height * 0.045),
        //     Expanded(
        //       child: GridView.builder(
        //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 2,
        //           mainAxisExtent: 130,
        //           mainAxisSpacing: 16,
        //           crossAxisSpacing: 0,
        //         ),
        //         itemCount: 4,
        //         itemBuilder: (context, index) {
        //           FoodTypeModel foodTypeModel = foodTypeData[index];
        //           return GestureDetector(
        //             onTap: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => const FoodRecipe()),
        //               );
        //             },
        //             child: GridTile(
        //               header: GridTileBar(
        //                 leading: Container(
        //                   width: 50,
        //                   height: 12,
        //                   decoration: const BoxDecoration(
        //                     color: Color(0xFF697C37),
        //                     borderRadius: BorderRadius.all(Radius.circular(4)),
        //                   ),
        //                   child: Padding(
        //                     padding: const EdgeInsets.only(left: 3),
        //                     child: Row(
        //                       children: [
        //                         const Icon(
        //                           Icons.access_time,
        //                           color: Color(0xFFFFF4E5),
        //                           size: 9,
        //                         ),
        //                         const Spacer(),
        //                         Text(
        //                           '${foodTypeData[index].time}min',
        //                           style: const TextStyle(
        //                             fontSize: 8,
        //                             color: Color(0xFFFFF4E5),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               footer: GridTileBar(
        //                 backgroundColor: const Color(0xFFFFF4E5),
        //                 leading: Row(
        //                   children: [
        //                     Text(
        //                       foodTypeData[index].title,
        //                       style: const TextStyle(
        //                         color: Color(0xFF697C37),
        //                         fontSize: 15,
        //                         fontWeight: FontWeight.w300,
        //                       ),
        //                     ),
        //                     GestureDetector(
        //                       onTap: () {
        //                         setState(() {
        //                           foodTypeData[index].bookmark =
        //                               !foodTypeData[index].bookmark;
        //                           if (!foodTypeData[index].bookmark) {
        //                             provider.removeItem(foodTypeModel);
        //                           }
        //                           provider.addItems(foodTypeModel);
        //                           print("item added to provider!!");
        //                           print("${foodTypeData[index].id} this is id");
        //                         });
        //                       },
        //                       child: Container(
        //                         child: foodTypeData[index].bookmark
        //                             ? const Icon(
        //                                 Icons.bookmark,
        //                                 color: Color(0xFFFE9801),
        //                               )
        //                             : const Icon(
        //                                 Icons.bookmark_border,
        //                                 color: Color(0xFFFE9801),
        //                               ),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               child: Image.asset(
        //                 foodTypeData[index].image,
        //                 fit: BoxFit.fill,
        //               ),
        //             ),
        //           );
        //         },
        //       ),
        //     )
        //   ],
        // ),

                    // itemBuilder: (context,index)

                    // {
                    //  return GestureDetector(
                    //   onTap: (){
                    //     Navigator.push(context, MaterialPageRoute(builder: (context) => SavedPage()));
                    //   },

                    //    child: Container(
                    //       width: 154,
                    //       height: 130,
                    //       decoration: const BoxDecoration(
                    //         color: Color(0xFFFFF4E5),
                    //         borderRadius: BorderRadius.all(Radius.circular(4)),
                    //       ),
                    //       child: Stack(
                    //         children: [
                    //           Image.asset(foodTypeData[index].image,),
                    //           Column(
                    //             children: [
                    //                Padding(
                    //     padding: const EdgeInsets.only(right: 95, top: 3),
                    //     child: Container(
                    //       width: 50,
                    //       height: 12,
                    //       decoration: const BoxDecoration(
                    //         color: Color(0xFF697C37),
                    //         borderRadius: BorderRadius.all(Radius.circular(4)),
                    //       ),
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(left: 6),
                    //         child: Row(
                    //           children: [
                    //             const Icon(
                    //               Icons.access_time,
                    //               color: Color(0xFFFFF4E5),
                    //               size: 9,
                    //             ),
                    //             const Gap(5),
                    //             Text(
                    //               '${foodTypeData[index].time}sec',
                    //               style: const TextStyle(
                    //                   fontSize: 8, color: Color(0xFFFFF4E5)),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //                ),
                    //                const Gap(85),
                    //                Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       const Gap(5),
                    //       Text(
                    //        foodTypeData[index].title ,
                    //         style: const TextStyle(
                    //           color: Color(0xFF697C37),
                    //           fontFamily: 'Rowdies',
                    //           fontSize: 15,
                    //           fontWeight: FontWeight.w300,
                    //         ),
                    //       ),
                    //       const Gap(15),
                    //       GestureDetector(
                    //         onTap: (){
                    //   setState(() {
                    //   foodTypeData[index].bookmark = !foodTypeData[index].bookmark;
                    //   provider.addItems(food_type);
                    //   print("item added to provider!!");
                    // print("${ foodTypeData[index].id} this is id");
                    //   });
                    // },
                    //         child: Container(
                    //           child: foodTypeData[index].bookmark
                    // ? const Icon(Icons.bookmark)
                    // : const Icon(Icons.bookmark_border),
                    //         ),
                    //       )
                    //     ],
                    //                ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //  );
                    // },),