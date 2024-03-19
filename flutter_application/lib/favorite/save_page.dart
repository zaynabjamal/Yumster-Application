import 'package:flutter/material.dart';
import 'package:flutter_application/cheifPage/foodrecipe.dart';
import 'package:flutter_application/data/food_type_data.dart';
import 'package:flutter_application/favorite/empty_save_page.dart';
import 'package:flutter_application/provider/bookmark.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFCF8),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
            child: Image.asset('assets/logo.png'),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 22,
                  right: 10,
                ),
                child: SvgPicture.asset('assets/arcticons_recipe-keeper.svg'),
              ),
              const Text(
                'Saved Recipe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffFE9801),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.1,
          ),
          Expanded(
            child: Consumer<BookmarkProvider>(
              builder: (context, provider, child) {
                if (provider.widget.isEmpty) {
                  return const EmptySave();
                } else {
                  return GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(
                      provider.widget.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.2)),
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
                                          builder: (context) =>
                                              const FoodRecipe()),
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 3),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.access_time,
                                                  color: Color(0xFFFFF4E5),
                                                  size: 9,
                                                ),
                                                const Gap(4),
                                                Text(
                                                  '${provider.widget[index].time}min',
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
                                        onTap: () {},
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
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

                  // ListView.builder(
                  //   itemCount: provider.widget.length,
                  //   itemBuilder: (context, index) {
                  //     return  Stack(
                  //         children: [
                  //           Column(
                  //             children: [
                  //               Padding(
                  //                 padding:
                  //                     const EdgeInsets.only(right: 95, top: 3),
                  //                 child: Container(
                  //                   width: 50,
                  //                   height: 12,
                  //                   decoration: const BoxDecoration(
                  //                     color: Color(0xFF697C37),
                  //                     borderRadius:
                  //                         BorderRadius.all(Radius.circular(4)),
                  //                   ),
                  //                   child: Padding(
                  //                     padding: const EdgeInsets.only(left: 6),
                  //                     child: Row(
                  //                       children: [
                  //                         const Icon(
                  //                           Icons.access_time,
                  //                           color: Color(0xFFFFF4E5),
                  //                           size: 9,
                  //                         ),
                  //                         const Gap(5),
                  //                         Text(
                  //                           '${provider.widget[index].time}sec',
                  //                           style: const TextStyle(
                  //                               fontSize: 8,
                  //                               color: Color(0xFFFFF4E5)),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //               const Gap(85),
                  //               GridTileBar(
                  //                 leading: Row(
                  //                   mainAxisAlignment:
                  //                       MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     const Gap(5),
                  //                     Text(
                  //                       foodTypeData[index].title,
                  //                       style: const TextStyle(
                  //                         color: Color(0xFF697C37),
                  //                         fontFamily: 'Rowdies',
                  //                         fontSize: 15,
                  //                         fontWeight: FontWeight.w300,
                  //                       ),
                  //                     ),
                  //                     const Gap(15),
                  //                     GestureDetector(
                  //                       onTap: () {},
                  //                       child: Container(
                  //                         child: foodTypeData[index].bookmark
                  //                             ? const Icon(Icons.bookmark)
                  //                             : const Icon(
                  //                                 Icons.bookmark_border),
                  //                       ),
                  //                     )
                  //                   ],
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       )
                  //     ;
                  //   },
                  // );