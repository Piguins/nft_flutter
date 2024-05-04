import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/home_container_screen/home_container_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/on_boarding_screen/on_boarding_screen.dart'; // ignore_for_file: must_be_immutable

class AppRoutes {
  static const String loginScreen = '/login_screen';

  static const String onBoardingScreen = '/on_boarding_screen';

  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    loginScreen: (context) => LoginScreen(),
    onBoardingScreen: (context) => OnBoardingScreen(),
    homeContainerScreen: (context) => HomeContainerScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => LoginScreen()
  };
}
