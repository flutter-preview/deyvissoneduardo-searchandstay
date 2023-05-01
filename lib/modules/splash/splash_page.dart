import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:searchandstay/theme/colors.dart';
import './splash_controller.dart';
import 'widgets/logo_center.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kbackgroundColor,
      body: Center(child: LogoCenter()),
    );
  }
}
