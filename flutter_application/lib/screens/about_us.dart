import 'package:flutter/material.dart';
import 'package:flutter_application/custom%20classes/about_us_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFCFCF8),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                 Navigator.pop(context);
              },
              icon: SvgPicture.asset("assets/arrowBack.svg")),
          centerTitle: true,
          title: const Text(
            'About Us',
            style: TextStyle(
              color: Color(0xffFE9801),
              fontSize: 32,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 55, vertical: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome to ',
                        style: TextStyle(
                            color: Color(0xff697C37),
                            fontSize: 16,
                            fontFamily: 'Rowdies'),
                      ),
                      TextSpan(
                        text: 'Yumster',
                        style: TextStyle(
                            color: Color(0xffFE9801),
                            fontSize: 16,
                            fontFamily: 'Rowdies'),
                      ),
                      TextSpan(
                        text: ', Your Ultimate\nRecipe Companion',
                        style: TextStyle(
                            color: Color(0xff697C37),
                            fontSize: 16,
                            fontFamily: 'Rowdies'),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  'At Yumster, we`re passionate about bringing delicious recipes right to your fingertips. Our dedicated team works tirelessly to ensure that you have access to a wide range of recipes to explore and enjoy.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xffB0AA86),
                    fontSize: 14,
                  ),
                ),
              ),
              const Text(
                'Our Team',
                style: TextStyle(
                  color: Color(0xffFE9801),
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  children: [
                    AboutUsText(
                        text: 'Zaynab Jamal -Mobile Developer & Leader'),
                    AboutUsText(text: 'Sana Assi - UI/UX Designer'),
                    AboutUsText(text: 'Lava Ramzi -Mobile Developer'),
                    AboutUsText(text: 'Sara Yassin - Developer'),
                    AboutUsText(text: 'Huda Ghazi - Data Entry'),
                  ],
                ),
              ),
              const Text(
                'Our Mission',
                style: TextStyle(
                  color: Color(0xffFE9801),
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  'Our mission at Yumster is to simplify your cooking experience and inspire culinary creativity. Whether you`re a seasoned chef or a kitchen novice, we`re here to help you discover new flavors and master your favorite dishes.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xffB0AA86),
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Have questions, feedback, or suggestions? We`d love to hear from you! Feel free to reach out to our team at ',
                        style: TextStyle(
                            color: Color(0xff697C37),
                            fontSize: 12,
                            fontFamily: 'Rowdies'),
                      ),
                      TextSpan(
                        text: 'contact@yumster.com ',
                        style: TextStyle(
                            color: Color(0xffFE9801),
                            fontSize: 12,
                            fontFamily: 'Rowdies'),
                      ),
                      TextSpan(
                        text: ' and we`ll be happy to assist you',
                        style: TextStyle(
                            color: Color(0xff697C37),
                            fontSize: 12,
                            fontFamily: 'Rowdies'),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(20)
            ],
          ),
        ),
      ),
    );
  }
}
