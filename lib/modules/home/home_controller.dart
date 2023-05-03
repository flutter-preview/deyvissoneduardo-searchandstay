import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchandstay/model/item.dart';
import 'package:searchandstay/service/account/user_service.dart';
import 'package:searchandstay/service/home/home_service.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final HomeService _homeService;
  final UserService _userService;

  Rx<IconData> lastTapped = Icons.add.obs;

  final itemList = RxList(<Item>[]);
  Rx<bool> isLoading = false.obs;
  Rx<bool> shouldPop = true.obs;

  TextEditingController controllerName = TextEditingController();

  HomeController(
      {required HomeService homeService, required UserService userService})
      : _homeService = homeService,
        _userService = userService;

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
    debugPrint('${response.itens}');
    itemList.addAll(response.itens);
  }

  Future<void> createHouseRule() async {
    isLoading.value = true;
    await _homeService.createHouseRule(controllerName.text.trim());
    controllerName.clear();
    await getAll();
    Get.back();
    isLoading.value = false;
  }

  Future<void> deleteHouseRule(int id) async {
    isLoading.value = true;
    await _homeService.deleteItem(id);
    await getAll();
    Get.back();
    isLoading.value = false;
  }

  Future<void> updateHouseRule(int id) async {
    isLoading.value = true;
    await _homeService.updateItem(id, controllerName.text.trim());
    isLoading.value = false;
    controllerName.clear();
    await getAll();
    Get.back();
  }

  Future<void> signOut() async {
    await _userService.signOut();
  }

  void updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      lastTapped.value = icon;
    }
  }
}
