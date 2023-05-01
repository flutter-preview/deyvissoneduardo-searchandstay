import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  TextEditingController controllerEmail =
      TextEditingController(text: 'test@gmail.com');
  TextEditingController controllerPassword =
      TextEditingController(text: '123qwe');
  final GlobalKey<FormState> formKey = GlobalKey();
  Rx<bool> isLoading = false.obs;

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }
}
