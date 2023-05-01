import 'package:searchandstay/model/entities.dart';
import 'package:searchandstay/modules/core/rest_client/dio_rest_client.dart';
import 'package:searchandstay/repository/home/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final DioRestClient _restClient;

  HomeRepositoryImpl({required DioRestClient restClient})
      : _restClient = restClient;

  @override
  Future<Entities> getAll() async {
    final result = await _restClient.get(
      '/house_rules',
      headers: {
        'Authorization':
            'Bearer 40fe071962846075452a4f6123ae71697463cad20f51e237e2035b41af0513d8'
      },
    );
    final content = Entities.fromMap(result.data);
    return content;
  }
}
