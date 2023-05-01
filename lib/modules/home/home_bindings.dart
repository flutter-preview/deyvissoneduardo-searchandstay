import 'package:get/get.dart';
import 'package:searchandstay/modules/core/rest_client/dio_rest_client.dart';
import 'package:searchandstay/repository/home/home_repository.dart';
import 'package:searchandstay/repository/home/home_repository_impl.dart';
import 'package:searchandstay/service/home/home_service.dart';
import 'package:searchandstay/service/home/home_service_impl.dart';
import './home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(DioRestClient());
    Get.put<HomeRepository>(
        HomeRepositoryImpl(restClient: Get.find<DioRestClient>()));
    Get.put<HomeService>(
        HomeServiceImpl(homeRepository: Get.find<HomeRepository>()));
    Get.put(HomeController(homeService: Get.find<HomeService>()));
  }
}
