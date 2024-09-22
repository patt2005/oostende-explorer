import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oostende_explorer_app/main.dart';
import 'package:oostende_explorer_app/models/location.dart';
import 'package:oostende_explorer_app/utilities/app_provider.dart';
import 'package:oostende_explorer_app/utilities/colors.dart';
import 'package:oostende_explorer_app/utilities/font_names.dart';
import 'package:oostende_explorer_app/widgets/coins_card.dart';
import 'package:oostende_explorer_app/widgets/icon_widget.dart';
import 'package:oostende_explorer_app/widgets/location_card.dart';
import 'package:oostende_explorer_app/widgets/route_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  Text(
                    "Place of the day",
                    style: TextStyle(
                      fontFamily: interFont,
                      color: textColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: deviceSize.height * 0.02),
                  LocationCard(
                    locatoinInfo: locations[Random().nextInt(locations.length)],
                  ),
                  SizedBox(height: deviceSize.height * 0.03),
                  Text(
                    "Recommended routes",
                    style: TextStyle(
                      fontFamily: interFont,
                      color: textColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: deviceSize.height * 0.02),
                  Consumer<AppProvider>(
                    builder: (context, value, child) => Column(
                      children: [
                        for (var routeInfo in value.boughtRoutes)
                          RouteCard(routeInfo: routeInfo),
                      ],
                    ),
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
