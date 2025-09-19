import 'package:calley/core/network/api_client.dart';
import 'package:dio/dio.dart';

class DataService {
  final ApiClient api;

  DataService(this.api);

  Future<Response<dynamic>> list(String id) async {
    final response = await api.dio.get("/list/$id");
    return response;
  }

  Future<Response<dynamic>> getlist(String id) async {
    final response = await api.dio.get("/list/?userId=$id");
    return response;
  }
}
