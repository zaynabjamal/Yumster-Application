import 'package:flutter/material.dart';
import 'package:flutter_application/model/categories_module.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({super.key});

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  List<Category> categories = Category.getCategory();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
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
    );
  }
}
