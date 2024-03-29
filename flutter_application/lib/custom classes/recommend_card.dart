import 'package:flutter/material.dart';
import 'package:flutter_application/foodDetails/foodrecipe.dart';
import 'package:flutter_application/modules/food_data_module.dart';
import 'package:flutter_application/provider/bookmark.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';

class RecommendCard extends StatefulWidget {
  final FoodTypeModel foodType;
  const RecommendCard({super.key, required this.foodType});

  @override
  State<RecommendCard> createState() => _RecommendCardState();
}

class _RecommendCardState extends State<RecommendCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.width * 0.5,
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
                  Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4)),
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage(
                          widget.foodType.image,
                        ),
                        opacity: 0.75,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 4,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Color(0xFF697C37),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: Color(0xFFFFF4E5),
                              size: 9,
                            ),
                            const Gap(4),
                            Text(
                              widget.foodType.time,
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
                    widget.foodType.title,
                    style: const TextStyle(
                      color: Color(0xFF697C37),
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      final provider = Provider.of<BookmarkProvider>(
                        context,
                        listen: false,
                      );
                      provider.addItems(widget.foodType);
                    },
                    child: Consumer<BookmarkProvider>(
                      builder: (context, provider, _) {
                        final isBookmarked = provider.isExist(widget.foodType);
                        return isBookmarked
                            ? const Icon(
                                Icons.bookmark,
                                color: Color(0xffFE9801),
                              )
                            : const Icon(
                                Icons.bookmark_border,
                                color: Color(0xffFE9801),
                              );
                      },
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
