import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchandstay/service/user_service.dart';

class AccountController extends GetxController {
  TextEditingController controllerEmail =
      TextEditingController(text: 'test@gmail.com');
  TextEditingController controllerPassword =
      TextEditingController(text: '123qwe');
  TextEditingController controllerName =
      TextEditingController(text: 'Deyvisson');
  final GlobalKey<FormState> formKeyLogin = GlobalKey();
  final GlobalKey<FormState> formKeyRegister = GlobalKey();
  Rx<bool> isLoading = false.obs;

  final UserService _userService;

  AccountController({required UserService userService})
      : _userService = userService;

  Future<void> login() async {
    isLoading.value = true;
    await _userService.login(
      controllerEmail.text.trim(),
      controllerPassword.text.trim(),
    );
    isLoading.value = false;
  }

  Future<void> register() async {
    isLoading.value = true;
    await _userService.register(
      controllerName.text.trim(),
      controllerEmail.text.trim(),
      controllerPassword.text.trim(),
    );
    isLoading.value = false;
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }
}
