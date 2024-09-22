import 'package:oostende_explorer_app/utilities/route_status.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

final PersistentTabController navigationController =
    PersistentTabController(initialIndex: 0);

String getRouteStatusDisplayName(RouteStatus status) {
  switch (status) {
    case RouteStatus.notBought:
      return "Buy for 250";
    case RouteStatus.started:
      return "Start now";
    case RouteStatus.ended:
      return "Completed";
    default:
      return "Unknown";
  }
}

String formatDuration(int remainingSeconds) {
  int hours = remainingSeconds ~/ 3600;
  int minutes = (remainingSeconds % 3600) ~/ 60;
  int seconds = remainingSeconds % 60;

  if (hours > 0 && minutes > 0) {
    return '${hours}h ${minutes}min ${seconds}s';
  } else if (hours > 0) {
    return '${hours}h ${seconds}s';
  } else if (minutes > 0) {
    return '${minutes}min ${seconds}s';
  } else {
    return '${seconds}s';
  }
}
