import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchandstay/service/account/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AccountController extends GetxController {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerName = TextEditingController();

  final GlobalKey<FormState> formKeyLogin = GlobalKey();
  final GlobalKey<FormState> formKeyRegister = GlobalKey();

  Rx<bool> isLoading = false.obs;
  Rx<bool> isVisible = false.obs;

  final UserService _userService;

  AccountController({required UserService userService})
      : _userService = userService;

  Future<User?> login() async {
    isLoading.value = true;
    final user = await _userService.login(
      controllerEmail.text.trim(),
      controllerPassword.text.trim(),
    );
    isLoading.value = false;
    return user;
  }

  Future<User?> register() async {
    isLoading.value = true;
    final user = await _userService.register(
      controllerName.text.trim(),
      controllerEmail.text.trim(),
      controllerPassword.text.trim(),
    );
    isLoading.value = false;
    return user;
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }
}
