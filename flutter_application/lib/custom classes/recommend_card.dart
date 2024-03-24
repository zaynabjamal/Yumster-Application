import 'package:flutter/material.dart';
import 'package:flutter_application/cheifPage/foodrecipe.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class RecommendCard extends StatefulWidget {
  String name;
  String time;
  String image;
  RecommendCard(
      {super.key, required this.name, required this.time, required this.image});

  @override
  State<RecommendCard> createState() => _RecommendCardState();
}

class _RecommendCardState extends State<RecommendCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.5,
        height: MediaQuery.sizeOf(context).width * 0.5,
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
                  MaterialPageRoute(builder: (context) => const FoodRecipe()),
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
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 4,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.15,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Color(0xFF697C37),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: Color(0xFFFFF4E5),
                              size: 9,
                            ),
                            const Gap(4),
                            Text(
                              widget.time,
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
                    widget.name,
                    style: const TextStyle(
                      color: Color(0xFF697C37),
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.bookmark_border,
                      color: Color(0xFFFE9801),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
