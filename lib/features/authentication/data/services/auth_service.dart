import 'package:calley/core/network/api_client.dart';
import 'package:dio/dio.dart';

class AuthService {
  final ApiClient api;

  AuthService(this.api);

  Future<Response<dynamic>> signup(String username, String email, String password) async {
    final response = await api.dio.post(
      "/auth/register",
      data: {"username": username, "email": email, "password": password},
    );
    return response;
  }

  Future<Response<dynamic>> login(String email, String password) async {
    final response = await api.dio.post(
      "/auth/login",
      data: {"email": email, "password": password},
    );
    return response;
  }

  Future<Response<dynamic>> otpRequest(String email) async {
    final response = await api.dio.post(
      "/auth/send-otp",
      data: {"email": email},
    );
    return response;
  }

  Future<Response<dynamic>> verifyOtp(String email, String otp) async {
    final response = await api.dio.post(
      "/auth/verify-otp",
      data: {"email": email, "otp": otp},
    );
    return response;
  }
}
