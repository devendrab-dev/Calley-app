import 'package:calley/core/network/api_client.dart';
import 'package:dio/dio.dart';

class DataService {
  final ApiClient api;

  DataService(this.api);

  Future<Response<dynamic>> list() async {
    final response = await api.dio.get("/list/68626fb697757cb741f449b9");
    return response;
  }
}
