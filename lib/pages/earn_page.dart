import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oostende_explorer_app/main.dart';
import 'package:oostende_explorer_app/utilities/app_provider.dart';
import 'package:oostende_explorer_app/utilities/colors.dart';
import 'package:oostende_explorer_app/utilities/font_names.dart';
import 'package:oostende_explorer_app/widgets/coins_card.dart';
import 'package:oostende_explorer_app/widgets/icon_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class EarnPage extends StatefulWidget {
  const EarnPage({super.key});

  @override
  State<EarnPage> createState() => _EarnPageState();
}

class _EarnPageState extends State<EarnPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context, listen: false);
    provider.addCoins(387);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const IconWidget(),
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
                        CupertinoIcons.money_dollar,
                        color: kCardColor,
                        size: 60,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "You earned 378 Oostende\nCoins for this route",
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
                      "Your current balance:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: montserratFont,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Consumer<AppProvider>(
                      builder: (context, value, child) => CoinsCard(
                        coins: value.totalCoins,
                      ),
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
                        PersistentNavBarNavigator.pop(context);
                        PersistentNavBarNavigator.pop(context);
                        PersistentNavBarNavigator.pop(context);
                      },
                      child: const Text(
                        "Buy new route",
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
