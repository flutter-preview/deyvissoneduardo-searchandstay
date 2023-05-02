import 'package:searchandstay/model/entities.dart';

abstract class HomeService {
  Future<Entities> getAll();
  Future<void> createHouseRule(String name);
}
