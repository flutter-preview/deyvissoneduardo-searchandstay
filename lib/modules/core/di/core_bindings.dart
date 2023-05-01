import 'package:get/get.dart';
import 'package:searchandstay/modules/account/account_bindings.dart';
import 'package:searchandstay/modules/home/home_bindings.dart';
import 'package:searchandstay/modules/splash/splash_bindings.dart';

class CoreBindings implements Bindings {
  @override
  void dependencies() {
    AccountBindings().dependencies();
    HomeBindings().dependencies();
    SplashBindings().dependencies();
  }
}
