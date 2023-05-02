import 'package:searchandstay/model/entities.dart';

abstract class HomeRepository {
  Future<Entities> getAll();
  Future<void> createHouseRule(String name);
}
