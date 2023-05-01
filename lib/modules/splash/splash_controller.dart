import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:searchandstay/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    GetStorage session = GetStorage();
    if (session.read('SESSION') != '') {
      Future.delayed(const Duration(seconds: 5),
          () => Get.offAllNamed(AppRoutes.ACCOUNTPAGE));
    } else {
      Get.offAllNamed(AppRoutes.ACCOUNTPAGE);
    }
    super.onInit();
  }
}
