import 'package:dio/dio.dart';
import 'package:json_api_test/model/model.dart';

class GetUserService {
  final Dio dio = Dio();
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<GetUser>> getUser() async {
    try {
      final response = await dio.get(baseUrl);
      print(response.data);
      return (response.data as List).map((e) => GetUser.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to load post:$e');
    }
  }
}
