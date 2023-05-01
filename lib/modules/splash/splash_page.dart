import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: context.heightTransformer(reducedBy: 90)),
              child: const LinearProgressIndicator(
                minHeight: 4.0,
                backgroundColor: Colors.orange,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
