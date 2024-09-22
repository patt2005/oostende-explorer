import 'package:flutter/material.dart';
import 'package:oostende_explorer_app/models/route.dart';
import 'package:oostende_explorer_app/utilities/route_status.dart';

class AppProvider extends ChangeNotifier {
  final List<TravelRoute> _boughtRoutes = travelRoutes;
  List<TravelRoute> get boughtRoutes => _boughtRoutes;

  int _totalCoins = 250;
  int get totalCoins => _totalCoins;

  void addCoins(int coins) {
    _totalCoins += coins;
    notifyListeners();
  }

  void subtractCoins(int coins) {
    _totalCoins -= 50;
    notifyListeners();
  }

  void buyRoute(TravelRoute route) {
    _boughtRoutes.firstWhere((r) => r == route).status = RouteStatus.started;
    _totalCoins -= 250;
    notifyListeners();
  }
}
