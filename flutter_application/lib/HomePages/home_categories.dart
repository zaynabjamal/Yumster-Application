import 'package:flutter/material.dart';
import 'package:flutter_application/FavoritePages/savePage.dart';
import 'package:flutter_application/HomePages/home_body.dart';
import 'package:flutter_application/model/categories_module.dart';
import 'package:flutter_application/profilepage/profilePage.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({super.key});

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  int _selectedIndex = 1;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screens[index]));
  }

  List<Widget> screens = [
    const SavedPage(),
    const HomeBody(),
    const ProfilePage(),
  ];
  List<Category> categories = Category.getCategory();

  @override
  Widget build(BuildContext context) {
     screens[_selectedIndex];
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          categories.length,
          (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, categories[index].route);
                });
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.black,
                  image: DecorationImage(
                    image: categories[index].image,
                    opacity: 0.6,
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Text(
                        categories[index].text,
                        style: const TextStyle(
                            color: Color(0xffFCFCF8),
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Concreteone'),
                      ),
                    ),
                  ],
                ),
              ),
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
