import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oostende_explorer_app/main.dart';
import 'package:oostende_explorer_app/utilities/app_provider.dart';
import 'package:oostende_explorer_app/utilities/colors.dart';
import 'package:oostende_explorer_app/utilities/font_names.dart';
import 'package:oostende_explorer_app/utilities/route_status.dart';
import 'package:oostende_explorer_app/utilities/utils.dart';
import 'package:oostende_explorer_app/widgets/coins_card.dart';
import 'package:oostende_explorer_app/widgets/icon_widget.dart';
import 'package:oostende_explorer_app/widgets/route_card.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const IconWidget(),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: deviceSize.width,
          height: deviceSize.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: deviceSize.height * 0.01),
                  Container(
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: Colors.black12),
                    ),
                    width: deviceSize.width,
                    padding: EdgeInsets.symmetric(
                      vertical: deviceSize.height * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: kCardColor.withOpacity(0.6),
                          ),
                          width: 120,
                          height: 120,
                          child: const Center(
                            child: Icon(
                              CupertinoIcons.person_fill,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "My profile",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: montserratFont,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Your current balance:",
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w400,
                            fontFamily: montserratFont,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Consumer<AppProvider>(
                          builder: (context, value, child) => CoinsCard(
                            coins: value.totalCoins,
                          ),
                        ),
                        const SizedBox(height: 25),
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation: const WidgetStatePropertyAll(0),
                            padding: const WidgetStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                            ),
                            backgroundColor: WidgetStatePropertyAll(kCardColor),
                          ),
                          onPressed: () async {
                            navigationController.index = 0;
                          },
                          child: const Text(
                            "Buy new route",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: interFont,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: deviceSize.height * 0.03),
                  Text(
                    "Bought routes",
                    style: TextStyle(
                      fontFamily: interFont,
                      color: textColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: deviceSize.height * 0.02),
                  Consumer<AppProvider>(
                    builder: (context, value, child) {
                      if (value.boughtRoutes
                              .where((r) => r.status == RouteStatus.notBought)
                              .length ==
                          value.boughtRoutes.length) {
                        return Column(
                          children: [
                            SizedBox(height: deviceSize.height * 0.07),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "You don't have any bought routes yet.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: interFont,
                                    color: textColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            for (var routeInfo in value.boughtRoutes.where(
                                (r) => r.status != RouteStatus.notBought))
                              RouteCard(routeInfo: routeInfo),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
