import 'package:flutter/material.dart';
import 'package:flutter_application/HomePages/home_body.dart';
import 'package:flutter_application/data/food_type_data.dart';
import 'package:flutter_application/model/food_type.dart';
import 'package:flutter_application/profilepage/profilePage.dart';
import 'package:flutter_application/provider/Bookmark.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => screens[index]));
  }

  List<Widget> screens = [
    const SavedPage(),
    const HomeBody(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    screens[_selectedIndex];
    return Scaffold(
      body: Expanded(
        child: Consumer<bookmarkProvider>(
          builder: (context, provider, child) {
            return ListView.builder(
              itemCount: provider.Widget.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFF4E5),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  child: Text(provider.Widget[index].title),
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
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffFFF5E5),
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xffFE9801),
        unselectedItemColor: const Color(0xffB0AA86),
        selectedIconTheme: const IconThemeData(size: 45, fill: 0.0),
        iconSize: 40,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? const Icon(Icons.bookmark)
                : const Icon(Icons.bookmark_border),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? const Icon(Icons.home)
                  : const Icon(Icons.home_outlined),
              label: ''),
          BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? const Icon(Icons.person)
                  : const Icon(Icons.person_outline_outlined),
              label: ''),
        ],
      ),
    );
  }
}
