import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchandstay/service/account/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AccountController extends GetxController {
  TextEditingController controllerEmail =
      TextEditingController(text: 'deyvissonarouche@gmail.com ');
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
    debugPrint('user => $user');
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
