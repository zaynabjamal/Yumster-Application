import 'package:flutter/material.dart';
import 'package:flutter_application/data/food_type_data.dart';
import 'package:flutter_application/model/food_type.dart';
import 'package:flutter_application/provider/Bookmark.dart';
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
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(top: 59, right: 181),
        //   child: Image.asset('assets/logo.png'),
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
        // Row(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(
        //         left: 22,
        //         right: 10,
        //       ),
        //       child: SvgPicture.asset('assets/arcticons_recipe-keeper.svg'),
        //     ),
        //     const Text(
        //       'Saved Recipe',
        //       style: TextStyle(
        //         fontSize: 24,
        //         fontWeight: FontWeight.w400,
        //         color: Color(0xffFE9801),
        //       ),
        //     ),
        //   ],
        // ),
         SizedBox(
          height: 340,
          child: Consumer<bookmarkProvider>(builder: (context, provider, child) {
            return ListView.builder(itemBuilder: (context, index){
              return Container(
                  width: 100,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFF4E5),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  child: Stack(
                    children: [
                      Image.asset(foodTypeData[index].image,),
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
                          '${foodTypeData[index].time}sec',
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
                   foodTypeData[index].title ,
                    style: const TextStyle(
                      color: Color(0xFF697C37),
                      fontFamily: 'Rowdies',
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Gap(15),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        foodTypeData[index].bookmark = !foodTypeData[index].bookmark;
                        provider.addItems(food_type);
                        print("item added to provider!!");
                      print("${ foodTypeData[index].id} this is id");
                      });
                    },
                    child: Container(
                      child: foodTypeData[index].bookmark
                    ? Icon(Icons.bookmark)
                    : Icon(Icons.bookmark_border),
                    ),
                  )
                ],
                           ),
                        ],
                      ),
                    ],
                  ),
                );
            },);
          },),
        ),
        // Center(
        //   child: Image.asset(
        //     'assets/illustration.png',
        //   ),
        // ),
        // const SizedBox(
        //   height: 30,
        // ),
        // const Text(
        //   'No recipes? Lets start cooking up some\n tasty adventures!',
        //   textAlign: TextAlign.center,
        //   style: TextStyle(
        //     fontSize: 12,
        //     color: Color(0xffFE9801),
            
        //   ),
        // ),
      ],
    );
  }
}
