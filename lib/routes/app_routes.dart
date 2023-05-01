import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchandstay/modules/account/register_page.dart';

import '../modules/account/account_bindings.dart';
import '../modules/account/account_page.dart';
import '../modules/home/home_bindings.dart';
import '../modules/home/home_page.dart';
import '../modules/splash/splash_bindings.dart';
import '../modules/splash/splash_page.dart';

class AppRoutes {
  static const SPLASHPAGE = '/splash_page';
  static const ACCOUNTPAGE = '/account_page';
  static const REGISTERPAGE = '/register_page';
  static const HOMEPAGE = '/home_page';

  static List<GetPage<Widget>> pages = [
    GetPage(
      name: AppRoutes.SPLASHPAGE,
      transitionDuration: const Duration(microseconds: 500),
      transition: Transition.fade,
      curve: Curves.linear,
      page: () => const SplashPage(),
      bindings: [SplashBindings()],
    ),
    GetPage(
      name: AppRoutes.ACCOUNTPAGE,
      transitionDuration: const Duration(microseconds: 500),
      transition: Transition.fade,
      curve: Curves.linear,
      page: () => const AccountPage(),
      bindings: [AccountBindings()],
    ),
    GetPage(
      name: AppRoutes.REGISTERPAGE,
      transitionDuration: const Duration(microseconds: 500),
      transition: Transition.fade,
      curve: Curves.linear,
      page: () => const RegisterPage(),
      bindings: [AccountBindings()],
    ),
    GetPage(
      name: AppRoutes.HOMEPAGE,
      transitionDuration: const Duration(microseconds: 500),
      transition: Transition.fade,
      curve: Curves.linear,
      page: () => const HomePage(),
      bindings: [HomeBindings()],
    ),
  ];
}
