import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchandstay/model/item.dart';
import 'package:searchandstay/service/home/home_service.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final HomeService _homeService;

  late AnimationController menuAnimation;

  Rx<IconData> lastTapped = Icons.add.obs;
  List<Widget> menuItems = const [
    Icon(Icons.edit),
    Icon(Icons.delete),
  ];

  RxList<Item>? itemList = <Item>[].obs;

  HomeController({required HomeService homeService})
      : _homeService = homeService;

  @override
  void onInit() {
    super.onInit();
    menuAnimation = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    getAll();
  }

  Future<void> getAll() async {
    final response = await _homeService.getAll();
    debugPrint('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    debugPrint('${response.itens}');
    itemList?.value = response.itens;
  }

  void updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      lastTapped.value = icon;
    }
  }
}
