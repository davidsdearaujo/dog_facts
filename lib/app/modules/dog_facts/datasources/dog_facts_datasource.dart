import 'package:dio/dio.dart';
// import 'package:dog_facts/modules/core/core_module.dart';

class DogFactsDatasource {
  final Dio _client;
  DogFactsDatasource(this._client);

  Future<String> getDogFacts() async {
    // throw Failure(code: 'mock-error', message: 'Ocorreu um erro forçado');
    const endpoint =
        'https://dog-facts-api.herokuapp.com/api/v1/resources/dogs?number=1';
    final response = await _client.get(endpoint);
    final fact = response.data[0]['fact'];
    return fact;
  }
}
