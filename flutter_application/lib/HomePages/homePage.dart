import 'package:flutter/material.dart';
import 'package:flutter_application/HomePages/home_categories.dart';
import 'package:flutter_svg/flutter_svg.dart';
class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Image.asset('assets/logo.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 12,
                    ),
                    child: SvgPicture.asset('assets/catagory.svg'),
                  ),
                  const Text(
                    'Food Catagories',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFE9801),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: 500,
               child: GridWidget(),
              ),
            ],
          ),
        ],
      );
  }
}