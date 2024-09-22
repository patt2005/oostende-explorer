import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oostende_explorer_app/main.dart';
import 'package:oostende_explorer_app/models/route.dart';
import 'package:oostende_explorer_app/pages/rating_page.dart';
import 'package:oostende_explorer_app/utilities/app_provider.dart';
import 'package:oostende_explorer_app/utilities/colors.dart';
import 'package:oostende_explorer_app/utilities/font_names.dart';
import 'package:oostende_explorer_app/utilities/utils.dart';
import 'package:oostende_explorer_app/widgets/coins_card.dart';
import 'package:oostende_explorer_app/widgets/icon_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class RoutePage extends StatefulWidget {
  final TravelRoute routeInfo;

  const RoutePage({
    super.key,
    required this.routeInfo,
  });

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late Timer _timer;

  bool _timeRunOut = false;

  bool _started = false;

  int _remainingSeconds = 4080;

  final List<int> _stopsFinished = [];
  final List<int> _progressStops = [];

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _timeRunOut = true;
          if (_stopsFinished.isEmpty) {
            _stopsFinished.add(0);
          } else {
            _stopsFinished.add(_stopsFinished.last + 1);
          }
          _timer.cancel();
          setState(() {});
        }
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context, listen: false);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
        ),
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
        bottom: false,
        child: Stack(
          children: [
            Positioned.fill(
              child: GoogleMap(
                myLocationButtonEnabled: false,
                onMapCreated: (GoogleMapController controller) async {
                  _controller.complete(controller);
                },
                myLocationEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: widget.routeInfo.stops.first.location,
                  zoom: 15,
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.29,
              minChildSize: 0.29,
              maxChildSize: 0.8,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 35,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          widget.routeInfo.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: montserratFont,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.routeInfo.description,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontFamily: montserratFont,
                          ),
                        ),
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.info,
                              animType: AnimType.scale,
                              title: 'Average Time Per Stop',
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
                                  'Each route stop takes an average of 1 hour and 8 minutes to complete. '
                                  'Plan accordingly to ensure you have enough time to enjoy all the stops.',
                              btnOkText: "Got it",
                              btnOkOnPress: () {},
                              showCloseIcon: true,
                            ).show();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 13),
                            width: deviceSize.width,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0C79FE),
                              borderRadius:
                                  BorderRadiusDirectional.circular(15),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.car,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 7),
                                Text(
                                  "1 hour 8 minutes per stop",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: montserratFont,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          width: deviceSize.width,
                          padding: const EdgeInsets.symmetric(
                            vertical: 13,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            color: kBackgroundColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hours",
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: montserratFont,
                                  fontSize: 17,
                                ),
                              ),
                              const Text(
                                "17:00 - 00:00",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: montserratFont,
                                  fontSize: 17,
                                ),
                              ),
                              const Text(
                                "Closed",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: montserratFont,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "Main stops:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: montserratFont,
                          ),
                        ),
                        const SizedBox(height: 10),
                        for (int i = 0; i < widget.routeInfo.stops.length; i++)
                          Container(
                            margin: const EdgeInsets.only(bottom: 13),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: _stopsFinished.contains(i)
                                        ? Colors.green
                                        : _progressStops.contains(i)
                                            ? Colors.grey.withOpacity(0.5)
                                            : kCardColor
                                                .withOpacity(1 - (i * 0.2)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (!_started)
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                backgroundColor: kCardColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () async {
                                setState(() {
                                  _started = true;
                                  _progressStops.add(0);
                                  _startTimer();
                                });
                              },
                              child: const Text(
                                "Start",
                                style: TextStyle(
                                  fontFamily: interFont,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        if (_started)
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 7),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: CupertinoColors.white,
                                    border: Border.all(color: textColor),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.clock,
                                        color: textColor,
                                        size: 13,
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        formatDuration(_remainingSeconds),
                                        style: TextStyle(
                                          color: textColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontFamily: interFont,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: const WidgetStatePropertyAll(0),
                                    padding: const WidgetStatePropertyAll(
                                      EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 15,
                                      ),
                                    ),
                                    backgroundColor: WidgetStatePropertyAll(
                                        _timeRunOut
                                            ? kCardColor
                                            : kCardColor.withOpacity(0.5)),
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (_stopsFinished.length == 5) {
                                      PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: const RatingPage(),
                                        withNavBar: true,
                                        pageTransitionAnimation:
                                            PageTransitionAnimation.cupertino,
                                      );
                                    } else if (_timeRunOut) {
                                      _progressStops
                                          .add(_progressStops.last + 1);
                                      provider.addCoins(50);
                                      _remainingSeconds = 4080;
                                      _timeRunOut = false;
                                      _startTimer();
                                      final GoogleMapController controller =
                                          await _controller.future;
                                      await controller.animateCamera(
                                        CameraUpdate.newCameraPosition(
                                          CameraPosition(
                                            target: widget
                                                .routeInfo
                                                .stops[_stopsFinished.last]
                                                .location,
                                            zoom: 15,
                                          ),
                                        ),
                                      );
                                      setState(() {});
                                    }
                                  },
                                  child: Text(
                                    "Done",
                                    style: TextStyle(
                                      fontFamily: interFont,
                                      color: _timeRunOut
                                          ? Colors.black
                                          : textColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: const WidgetStatePropertyAll(
                                      EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 15,
                                      ),
                                    ),
                                    backgroundColor:
                                        const WidgetStatePropertyAll(
                                            CupertinoColors.white),
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        side: BorderSide(color: textColor),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    final provider = Provider.of<AppProvider>(
                                        context,
                                        listen: false);
                                    if (provider.totalCoins >= 50) {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.info,
                                        animType: AnimType.scale,
                                        title: 'Confirm Skip',
                                        descTextStyle: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                        titleTextStyle: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                        desc:
                                            'Do you want to skip this route? This will cost you 50 coins.',
                                        btnCancelText: "Cancel",
                                        btnCancelOnPress: () {},
                                        btnOkText: "Confirm",
                                        btnOkOnPress: () {
                                          _timeRunOut = true;
                                          _timer.cancel();
                                          if (_stopsFinished.isEmpty) {
                                            _stopsFinished.add(0);
                                          } else {
                                            _stopsFinished
                                                .add(_stopsFinished.last + 1);
                                          }
                                          provider.subtractCoins(50);
                                          setState(() {});
                                        },
                                        showCloseIcon: true,
                                      ).show();
                                    } else {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.warning,
                                        animType: AnimType.scale,
                                        title: 'Not Enough Coins',
                                        descTextStyle: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                        titleTextStyle: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                        desc:
                                            'You don’t have enough coins to skip this route. Earn or purchase more coins to proceed.',
                                        btnOkText: "Ok",
                                        btnOkOnPress: () {},
                                        showCloseIcon: true,
                                      ).show();
                                    }
                                  },
                                  child: const Text(
                                    "Skip",
                                    style: TextStyle(
                                      fontFamily: interFont,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
