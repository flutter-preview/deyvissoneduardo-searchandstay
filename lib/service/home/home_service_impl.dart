import 'package:searchandstay/model/entities.dart';
import 'package:searchandstay/repository/home/home_repository.dart';
import 'package:searchandstay/service/home/home_service.dart';

class HomeServiceImpl implements HomeService {
  final HomeRepository _homeRepository;

  HomeServiceImpl({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  @override
  Future<Entities> getAll() => _homeRepository.getAll();

  @override
  Future<void> createHouseRule(String name) =>
      _homeRepository.createHouseRule(name);

  @override
  Future<void> deleteItem(int id) => _homeRepository.deleteItem(id);
  
  @override
  Future<void> updateItem(int id, String name) => _homeRepository.updateItem(id, name);
}
