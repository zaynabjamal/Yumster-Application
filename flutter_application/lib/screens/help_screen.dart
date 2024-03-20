//TODO Zaynab

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/data/help_page_data.dart';
import 'package:flutter_svg/svg.dart';

class Help extends StatelessWidget {
  const Help({super.key});

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
                'Help',
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
                        horizontal: 55, vertical: 20),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(children: [
                        TextSpan(
                            text: "Navigation ",
                            style: TextStyle(
                                color: Color(0XFF697C37),
                                fontSize: 18,
                                fontFamily: "Rowdies")),
                        TextSpan(
                            text: "Yumster",
                            style: TextStyle(
                                color: Color(0XFFFE9801),
                                fontSize: 18,
                                fontFamily: "Rowdies")),
                        TextSpan(
                            text: ": Your Recipe\nCompanion Guid",
                            style: TextStyle(
                                color: Color(0XFF697C37),
                                fontSize: 18,
                                fontFamily: "Rowdies"))
                      ]),
                    ),
                  ),
                  const HelpData(
                      number: "1",
                      title: "Explore Recipes",
                      sentence:
                          "Browse through recipes by categories such as Breakfast, Lunch, Sea Food, and Dietary."),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Image.asset("assets/Frame 3.png"),
                  ),
                  const HelpData(
                      number: "2",
                      title: "Searches",
                      sentence:
                          "Use the search bar to find specific recipes or ingredients"),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Image.asset("assets/searchBar.png")),
                  const HelpData(
                      number: "3",
                      title: "Ingredients",
                      sentence: "View ingredients required for the recipe"),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Image.asset("assets/recipe.png")),
                  const HelpData(
                      number: "4",
                      title: "Saved Recipes",
                      sentence:
                          "Access your saved favorite recipes for easy reference"),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Image.asset("assets/foodtypecard.png")),
                  const HelpData(
                      number: "5",
                      title: "Chef's Section",
                      sentence: "Meet the mastermind behind this recipe"),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Image.asset("assets/cheff.png")),
                  const HelpData(
                      number: "6",
                      title: "Login & Sign Up",
                      sentence: "Creat an account for more authenticated"),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Image.asset("assets/Form.png")),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "Need help? Email us at ",
                            style: TextStyle(
                                color: Color(0XFF697C37),
                                fontSize: 16,
                                fontFamily: "Rowdies")),
                        TextSpan(
                            text: "contact@yumster.com",
                            style: TextStyle(
                                color: Color(0XFFFE9801),
                                fontSize: 16,
                                fontFamily: "Rowdies")),
                      ]))),
                ],
              ),
            )));
  }
}
