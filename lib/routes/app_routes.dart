import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/bnb_screen/bnb_screen.dart';
import '../presentation/eth_screen/eth_screen.dart';
import '../presentation/home_container_screen/home_container_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/wallet_page/wallet_page.dart';
import '../presentation/on_boarding_screen/on_boarding_screen.dart';
import '../presentation/transfer_screen/transfer_screen.dart';
import '../presentation/account_page/account_page.dart';

// import '../presentation/trade_screen/trade_screen.dart';

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String loginScreen = '/login_screen';
  static const String onBoardingScreen = '/on_boarding_screen';
  static const String homePage = '/home_page';
  static const String homeContainerScreen = '/home_container_screen';
  static const String walletPage = '/wallet_page';
  static const String bnbScreen = '/bnb_screen';
  static const String ethScreen = '/eth_screen';
  static const String tradeScreen = '/trade_screen';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String transferScreen = '/transfer_screen';
  static const String initialRoute = '/initialRoute';
  static const String accountPage = '/account_page';

  static Map<String, WidgetBuilder> routes = {
    loginScreen: (context) => LoginScreen(),
    onBoardingScreen: (context) => OnBoardingScreen(),
    homeContainerScreen: (context) => HomeContainerScreen(),
    bnbScreen: (context) => BnbScreen(),
    ethScreen: (context) => EthScreen(),
    walletPage: (context) => WalletPage(),
    transferScreen: (context) => TransferScreen(),

    // tradeScreen: (context) => TradeScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => LoginScreen()
  };
}
