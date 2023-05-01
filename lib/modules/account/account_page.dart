import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './account_controller.dart';

class AccountPage extends GetView<AccountController> {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AccountPage'),
      ),
      body: Container(),
    );
  }
}
