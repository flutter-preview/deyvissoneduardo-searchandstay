import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchandstay/model/item.dart';
import 'package:searchandstay/service/home/home_service.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final HomeService _homeService;

  Rx<IconData> lastTapped = Icons.add.obs;
  List<Widget> menuItems = const [
    Icon(Icons.edit),
    Icon(Icons.delete),
  ];

  RxList<Item>? itemList = <Item>[].obs;

  TextEditingController controllerName = TextEditingController();

  HomeController({required HomeService homeService})
      : _homeService = homeService;

  @override
  void onInit() {
    super.onInit();
    getAll();
  }

  @override
  void dispose() {
    controllerName.dispose();
    super.dispose();
  }

  Future<void> getAll() async {
    final response = await _homeService.getAll();
    debugPrint('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    debugPrint('${response.itens}');
    itemList?.value = response.itens;
  }

  Future<void> createHouseRule() async {
    await _homeService.createHouseRule(controllerName.text.trim());
    controllerName.clear();
    getAll();
    Get.back();
  }

  void updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      lastTapped.value = icon;
    }
  }
}
