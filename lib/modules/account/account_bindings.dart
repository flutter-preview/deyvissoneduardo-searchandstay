import 'package:get/get.dart';
import 'package:searchandstay/repository/account/user_repository.dart';
import 'package:searchandstay/repository/account/user_repository_impl.dart';
import 'package:searchandstay/service/account/user_service.dart';
import 'package:searchandstay/service/account/user_service_impl.dart';
import './account_controller.dart';

class AccountBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<UserRepository>(UserRepositoryImpl());
    Get.put<UserService>(
        UserServiceImpl(userRepository: Get.find<UserRepository>()));
    Get.put(AccountController(userService: Get.find<UserService>()));
  }
}
