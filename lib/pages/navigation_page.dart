import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oostende_explorer_app/models/route.dart';
import 'package:oostende_explorer_app/pages/home_page.dart';
import 'package:oostende_explorer_app/pages/profile_page.dart';
import 'package:oostende_explorer_app/pages/route_page.dart';
import 'package:oostende_explorer_app/utilities/app_provider.dart';
import 'package:oostende_explorer_app/utilities/colors.dart';
import 'package:oostende_explorer_app/utilities/font_names.dart';
import 'package:oostende_explorer_app/utilities/route_status.dart';
import 'package:oostende_explorer_app/utilities/utils.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const ProfilePage(),
      RoutePage(
        routeInfo: travelRoutes.first,
      )
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.widgets),
        title: ("Routes"),
        activeColorPrimary: kCardColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        routeAndNavigatorSettings:
            const RouteAndNavigatorSettings(defaultTitle: "Home"),
        onPressed: (p0) {
          navigationController.index = 0;
        },
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.person,
          color: Colors.white,
        ),
        title: ("Profile"),
        activeColorPrimary: kCardColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        onPressed: (p0) {
          navigationController.index = 1;
        },
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.map),
        title: ("Map"),
        activeColorPrimary: kCardColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        onPressed: (p0) {
          final provider = Provider.of<AppProvider>(context, listen: false);
          if (provider.boughtRoutes
                  .where((r) => r.status == RouteStatus.notBought)
                  .length !=
              provider.boughtRoutes.length) {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: RoutePage(
                routeInfo: provider.boughtRoutes
                    .where((r) => r.status == RouteStatus.notBought)
                    .first,
              ),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          } else {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.info,
              animType: AnimType.scale,
              title: 'Purchase Required',
              descTextStyle: const TextStyle(
                fontFamily: montserratFont,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              titleTextStyle: const TextStyle(
                fontFamily: montserratFont,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              desc:
                  'You need to purchase a route to access the map and follow along the journey. Please buy a route to continue.',
              btnCancel: null,
              showCloseIcon: true,
              btnOkText: "Ok",
              btnOkOnPress: () {},
            ).show();
          }
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: navigationController,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: Colors.white,
      isVisible: true,
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style15,
    );
  }
}
