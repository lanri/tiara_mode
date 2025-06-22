/***
router.dart: add route logic and header auto
created by @lanri.jait@gmail.com
last committed by @lanri.jait@gmail.com
***/

import 'package:flutter/material.dart';
import 'main.dart'; // untuk MainScreen
import 'package:tiara_mode/auth/login_screen.dart';
import 'package:tiara_mode/pages/dashboard_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  int tabIndex = 0;

  switch (settings.name) {
    case '/':
      tabIndex = 0;
      return MaterialPageRoute(builder: (_) => MainScreen(initialIndex: tabIndex));
    case '/portfolio':
      tabIndex = 1;
      return MaterialPageRoute(builder: (_) => MainScreen(initialIndex: tabIndex));
    case '/services':
      tabIndex = 2;
      return MaterialPageRoute(builder: (_) => MainScreen(initialIndex: tabIndex));
    case '/order':
      tabIndex = 3;
      return MaterialPageRoute(builder: (_) => MainScreen(initialIndex: tabIndex));
    case '/login':
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case '/dashboard':
      return MaterialPageRoute(builder: (_) => const DashboardScreen());
    default:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
  }
}
