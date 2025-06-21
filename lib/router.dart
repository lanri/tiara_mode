/***
router.dart: Router module
created by @lanri.jait@gmail.com
last committed by @
***/

import 'package:flutter/material.dart';
import 'main.dart'; // for MainScreen

/// Returns a route to MainScreen with the correct tab selected based on the URL.
Route<dynamic> generateRoute(RouteSettings settings) {
  int tabIndex = 0;

  switch (settings.name) {
    case '/':
      tabIndex = 0;
      break;
    case '/portfolio':
      tabIndex = 1;
      break;
    case '/services':
      tabIndex = 2;
      break;
    case '/order':
      tabIndex = 3;
      break;
    default:
      tabIndex = 0;
  }

  return MaterialPageRoute(
    builder: (_) => MainScreen(initialIndex: tabIndex),
  );
}
