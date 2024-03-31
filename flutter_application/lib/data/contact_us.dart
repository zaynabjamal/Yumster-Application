import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xffFCFCF8),
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset("assets/ArrowBackGreen.svg")),
              centerTitle: true,
              title: const Text(
                'Contact Us',
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 55, vertical: 50),
                    child: Image.asset("assets/contactus.png"),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Text(
                        "Have questions, feedback, or suggestions? We'd love to hear from you! Feel free to reach out us , and we'll be delighted to assist you in more detail",
                        style: TextStyle(
                            color: Color(0XFF697C37),
                            fontSize: 16,
                            fontFamily: "Rowdies")),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: SvgPicture.asset("assets/email.svg"),
                        ),
                        const Gap(12),
                        const Text(
                          "contact@yumster.com",
                          style: TextStyle(
                            fontFamily: 'Rowdies',
                            fontSize: 16,
                            color: Color(0xFF697C37),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: SvgPicture.asset("assets/telephone.svg"),
                        ),
                        const Gap(12),
                        const Text(
                          "07501234567",
                          style: TextStyle(
                            fontFamily: 'Rowdies',
                            fontSize: 16,
                            color: Color(0xFF697C37),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: SvgPicture.asset("assets/facebook.svg"),
                        ),
                        const Gap(12),
                        const Text(
                          "Yumster",
                          style: TextStyle(
                            fontFamily: 'Rowdies',
                            fontSize: 16,
                            color: Color(0xFF697C37),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
