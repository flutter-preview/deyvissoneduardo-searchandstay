import 'package:flutter/rendering.dart';
import 'package:searchandstay/model/entities.dart';
import 'package:searchandstay/modules/core/rest_client/dio_rest_client.dart';
import 'package:searchandstay/repository/home/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final DioRestClient _restClient;

  HomeRepositoryImpl({required DioRestClient restClient})
      : _restClient = restClient;

  @override
  Future<Entities> getAll() async {
    final result = await _restClient.get('/house_rules');
    final content = Entities.fromMap(result.data);
    return content;
  }

  @override
  Future<void> createHouseRule(String name) async {
    final result = await _restClient.post(
      '/house_rules',
      data: {
        "house_rules": {
          "name": name,
          "active": 1,
        }
      },
    );
    debugPrint('${result.statusCode}');
    debugPrint('${result.statusMessage}');
  }

  @override
  Future<void> deleteItem(int id) async {
    final result = await _restClient.delete('/house_rules/$id');
    debugPrint('${result.statusCode}');
    debugPrint('${result.statusMessage}');
  }

  @override
  Future<void> updateItem(int id, String name) async {
    final result = await _restClient.put(
      '/house_rules/$id',
      data: {
        "house_rules": {
          "name": name,
          "active": 0,
        }
      },
    );
    debugPrint('${result.statusCode}');
    debugPrint('${result.statusMessage}');
    return result.data;
  }
}
