import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  @override
  void dispose() {
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }
}
