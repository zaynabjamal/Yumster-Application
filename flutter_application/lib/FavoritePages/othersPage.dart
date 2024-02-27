import 'package:flutter/material.dart';
import 'package:flutter_application/FavoritePages/savePage.dart';
import 'package:flutter_application/data/food_type_data.dart';
import 'package:flutter_application/model/food_type.dart';
import 'package:flutter_application/provider/Bookmark.dart';
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
    bool _isBookmark = false;
    final provider = Provider.of<bookmarkProvider>(context,
        listen: false); //contexte buildContext
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 220,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemCount: 4,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridTile(
                header: GridTileBar(
                  leading: Container(
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
                            '${foodTypeData[index].time}sec',
                            style: const TextStyle(
                                fontSize: 8, color: Color(0xFFFFF4E5)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                footer: GridTileBar(
                  backgroundColor:const Color(0xFFFFF4E5),
                  leading: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        foodTypeData[index].title,
                        style: const TextStyle(
                          color: Color(0xFF697C37),
                          fontFamily: 'Rowdies',
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const Gap(50),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            foodTypeData[index].bookmark =
                                !foodTypeData[index].bookmark;
                            provider.addItems(food_type);
                            if (foodTypeData[index].bookmark) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SavedPage()));
                            }
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
                              : const Icon(Icons.bookmark_border,
                                  color: Color(0xFFFE9801)),
                        ),
                      )
                    ],
                  ),
                ),
                child: Image.asset(
                  foodTypeData[index].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

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
          )
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

              )
        ],
      ),
    );
  }
}
