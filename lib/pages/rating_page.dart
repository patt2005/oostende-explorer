import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oostende_explorer_app/main.dart';
import 'package:oostende_explorer_app/pages/earn_page.dart';
import 'package:oostende_explorer_app/utilities/app_provider.dart';
import 'package:oostende_explorer_app/utilities/colors.dart';
import 'package:oostende_explorer_app/utilities/font_names.dart';
import 'package:oostende_explorer_app/widgets/coins_card.dart';
import 'package:oostende_explorer_app/widgets/icon_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  final List<int> _selectedStars = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const IconWidget(),
        actions: [
          Consumer<AppProvider>(
            builder: (context, value, child) => CoinsCard(
              coins: value.totalCoins,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: deviceSize.height * 0.05, horizontal: 20),
                width: deviceSize.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Icon(
                        CupertinoIcons.checkmark,
                        color: kCardColor,
                        size: 60,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "You have completed\nthe route",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: montserratFont,
                        fontSize: 19,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      "Please rate this route",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: montserratFont,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 5; i++)
                          GestureDetector(
                            onTap: () {
                              _selectedStars.clear();
                              for (int j = 0; j < i + 1; j++) {
                                _selectedStars.add(j);
                              }
                              setState(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 7),
                              child: Icon(
                                CupertinoIcons.star_fill,
                                color: _selectedStars.contains(i)
                                    ? kCardColor
                                    : Colors.grey,
                                size: 30,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: const WidgetStatePropertyAll(0),
                        padding: const WidgetStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                        ),
                        backgroundColor: WidgetStatePropertyAll(kCardColor),
                      ),
                      onPressed: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: const EarnPage(),
                          withNavBar: true,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      child: const Text(
                        "Rate",
                        style: TextStyle(
                          fontFamily: interFont,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
