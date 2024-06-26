import 'package:flutter/material.dart';
import 'package:flutter_application/save/empty_save_page.dart';
import 'package:flutter_application/modules/food_data_module.dart';
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
    final provider = Provider.of<BookmarkProvider>(context);
    final List<FoodTypeModel> bookmarkedItems = provider.widget;

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
                if (bookmarkedItems.isEmpty) {
                  return const EmptySave();
                } else {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: bookmarkedItems.length,
                    itemBuilder: (context, index) {
                      final item = bookmarkedItems[index];
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
                                          bookmarkedItems[index].foodDetail),
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
                                          item.image,
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
                                                item.time,
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
                                      item.title,
                                      style: const TextStyle(
                                        color: Color(0xFF697C37),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        provider.addItems(item);
                                      },
                                      child: Container(
                                        child: provider.isExist(item)
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
