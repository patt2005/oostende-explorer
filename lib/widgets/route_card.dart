import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oostende_explorer_app/models/route.dart';
import 'package:oostende_explorer_app/pages/route_page.dart';
import 'package:oostende_explorer_app/utilities/app_provider.dart';
import 'package:oostende_explorer_app/utilities/colors.dart';
import 'package:oostende_explorer_app/utilities/font_names.dart';
import 'package:oostende_explorer_app/utilities/route_status.dart';
import 'package:oostende_explorer_app/utilities/utils.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class RouteCard extends StatefulWidget {
  final TravelRoute routeInfo;

  const RouteCard({
    super.key,
    required this.routeInfo,
  });

  @override
  State<RouteCard> createState() => _RouteCardState();
}

class _RouteCardState extends State<RouteCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(13),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  widget.routeInfo.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: montserratFont,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 7),
              ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  elevation: const WidgetStatePropertyAll(0),
                  backgroundColor: const WidgetStatePropertyAll(Colors.green),
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  ),
                ),
                onPressed: () {
                  if (widget.routeInfo.status == RouteStatus.notBought) {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.info,
                      animType: AnimType.scale,
                      title: 'Confirm Purchase',
                      titleTextStyle: const TextStyle(
                        fontFamily: montserratFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      descTextStyle: const TextStyle(
                        fontFamily: montserratFont,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      desc:
                          'Are you sure you want to buy this route? Once purchased, you will have access to the map and can follow along the journey.',
                      btnCancelText: "Cancel",
                      btnCancelOnPress: () {},
                      btnOkText: "Confirm",
                      btnOkOnPress: () {
                        final provider =
                            Provider.of<AppProvider>(context, listen: false);
                        if (provider.totalCoins >= 250) {
                          provider.buyRoute(widget.routeInfo);
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.scale,
                            title: 'Purchase Successful',
                            titleTextStyle: const TextStyle(
                              fontFamily: montserratFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            descTextStyle: const TextStyle(
                              fontFamily: montserratFont,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                            desc:
                                'Congratulations! You have successfully purchased this route. You now have full access to the map and can follow along the journey.',
                            btnOkText: "Start Exploring",
                            btnOkOnPress: () {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: RoutePage(
                                  routeInfo: widget.routeInfo,
                                ),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            showCloseIcon: true,
                          ).show();
                        } else {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            animType: AnimType.scale,
                            title: 'Not Enough Coins',
                            titleTextStyle: const TextStyle(
                              fontFamily: montserratFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            descTextStyle: const TextStyle(
                              fontFamily: montserratFont,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                            desc:
                                'You don\'t have enough coins to buy this route. Earn more coins or purchase them to proceed.',
                            btnOkText: "Get Coins",
                            btnOkOnPress: () {},
                            showCloseIcon: true,
                          ).show();
                        }
                      },
                      showCloseIcon: true,
                    ).show();
                  } else {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: RoutePage(
                        routeInfo: widget.routeInfo,
                      ),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  }
                },
                child: Text(
                  getRouteStatusDisplayName(widget.routeInfo.status),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              Icon(
                CupertinoIcons.clock,
                color: textColor,
                size: 19,
              ),
              const SizedBox(width: 7),
              Text(
                "3-4 hours",
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: montserratFont,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              for (var topic in widget.routeInfo.relatedTopics)
                Container(
                  margin: const EdgeInsets.only(right: 7),
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    topic,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: interFont,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 13),
          Row(
            children: [
              Icon(
                CupertinoIcons.map,
                color: textColor,
                size: 19,
              ),
              const SizedBox(width: 7),
              Text(
                "Main stops:",
                style: TextStyle(
                  color: textColor,
                  fontFamily: montserratFont,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          for (int i = 0; i < 2; i++)
            Container(
              margin: const EdgeInsets.only(bottom: 13),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: kCardColor.withOpacity(1 - (i * 0.6)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        "${i + 1}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: montserratFont,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.routeInfo.stops[i].title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: montserratFont,
                          ),
                          maxLines: null,
                          overflow: TextOverflow.visible,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.routeInfo.stops[i].description,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 15,
                            fontFamily: montserratFont,
                            fontWeight: FontWeight.w300,
                          ),
                          maxLines:
                              2, // Allow description to wrap into multiple lines
                          overflow: TextOverflow
                              .ellipsis, // Handle overflow gracefully
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
