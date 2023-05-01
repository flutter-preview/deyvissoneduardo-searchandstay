import 'package:searchandstay/model/entities.dart';

abstract class HomeRepository {
  Future<Entities> getAll();
}
