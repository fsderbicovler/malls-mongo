import 'package:clientmongo/malls.dart';
import 'package:dio/dio.dart';

class MallsApi {
  final _dio = new Dio(BaseOptions(baseUrl: 'http://localhost:8081/'));

  //GET
  Future<List<Malls>> getMalls() async {
    final response = await _dio.get('');
    return (response.data['malls'] as List)
        .map<Malls>((json) => Malls.fromJson(json))
        .toList();
  }

  //POST
  Future<Malls> createMalls(String name, String area) async {
    final response = await _dio.post('', data: {'name': name, 'area': area});
    return Malls.fromJson(response.data);
  }

  //DELETE
  Future deleteMalls(String id) async {
    final response = await _dio.delete('/$id');
    return response.data;
  }
}
