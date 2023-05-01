import 'package:get/get.dart';
import 'package:searchandstay/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 1),
        () => Get.offAllNamed(AppRoutes.ACCOUNTPAGE));
    super.onInit();
  }
}
