import 'package:get/get.dart';
import 'package:searchandstay/repository/user_repository_impl.dart';
import 'package:searchandstay/service/user_service.dart';
import 'package:searchandstay/service/user_service_impl.dart';
import '../../repository/user_repository.dart';
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
