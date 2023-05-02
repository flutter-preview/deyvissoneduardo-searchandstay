import 'package:searchandstay/model/entities.dart';

abstract class HomeRepository {
  Future<Entities> getAll();
  Future<void> createHouseRule(String name);
  Future<void> deleteItem(int id);
  Future<void> updateItem(int id, String name);
}
