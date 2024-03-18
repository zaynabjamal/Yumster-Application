import 'package:flutter/material.dart';
import 'package:flutter_application/favorite/empty_save_page.dart';
import 'package:flutter_application/provider/bookmark.dart';
import 'package:flutter_svg/svg.dart';
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
          SizedBox(height: MediaQuery.of(context).size.width * 0.2,),
          Expanded(
            child: Consumer<BookmarkProvider>(
              builder: (context, provider, child) {
                if (provider.widget.isEmpty) {
                  return const EmptySave();
                } else {
                  return ListView.builder(
                    itemCount: provider.widget.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFF4E5),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        child: Text(provider.widget[index].title),
                        // child: Stack(
                        //   children: [
                        //     Text(provider.Widget[index].title),
                        //     Column(
                        //       children: [
                        //         Padding(
                        //           padding: const EdgeInsets.only(right: 95, top: 3),
                        //           child: Container(
                        //             width: 50,
                        //             height: 12,
                        //             decoration: const BoxDecoration(
                        //               color: Color(0xFF697C37),
                        //               borderRadius: BorderRadius.all(Radius.circular(4)),
                        //             ),
                        //             child: Padding(
                        //               padding: const EdgeInsets.only(left: 6),
                        //               child: Row(
                        //                 children: [
                        //                   const Icon(
                        //                     Icons.access_time,
                        //                     color: Color(0xFFFFF4E5),
                        //                     size: 9,
                        //                   ),
                        //                   const Gap(5),
                        //                   Text(
                        //                     '${provider.Widget[index].time}sec',
                        //                     style: const TextStyle(fontSize: 8, color: Color(0xFFFFF4E5)),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //         const Gap(85),
                        //         GridTileBar(
                        //           leading: Row(
                        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //             children: [
                        //               const Gap(5),
                        //               Text(
                        //                 foodTypeData[index].title,
                        //                 style: const TextStyle(
                        //                   color: Color(0xFF697C37),
                        //                   fontFamily: 'Rowdies',
                        //                   fontSize: 15,
                        //                   fontWeight: FontWeight.w300,
                        //                 ),
                        //               ),
                        //               const Gap(15),
                        //               GestureDetector(
                        //                 onTap: () {

                        //                 },
                        //                 child: Container(
                        //                   child: foodTypeData[index].bookmark ? const Icon(Icons.bookmark) : const Icon(Icons.bookmark_border),
                        //                 ),
                        //               )
                        //             ],
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                      );
                    },
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
