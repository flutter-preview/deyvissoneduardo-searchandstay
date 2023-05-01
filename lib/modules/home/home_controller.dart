import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController menuAnimation;
  Rx<IconData> lastTapped = Icons.add.obs;
  List<Widget> menuItems = const [
    Icon(Icons.edit),
    Icon(Icons.delete),
  ];

  @override
  void onInit() {
    super.onInit();
    menuAnimation = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }

  void updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      lastTapped.value = icon;
    }
  }
}
