import 'package:calley/features/authentication/data/models/user_model.dart';
import 'package:calley/features/authentication/data/services/auth_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:dio/dio.dart';

class Failure {
  final String message;
  Failure([this.message = "Unexpected Error"]);
}

class AuthRepository {
  final AuthService service;

  AuthRepository(this.service);

  Future<Either<Failure, String>> signup(
    String username,
    String email,
    String password,
  ) async {
    try {
      final response = await service.signup(username, email, password);
      if (response.statusCode == 201) {
        return Right(response.data["message"]);
      }
      return Left(Failure(response.data["message"]));
    } on DioException catch (e) {
      return Left(Failure(e.response?.data['message'] ?? 'Signup failed'));
    } catch (e) {
      return Left(Failure());
    }
  }

  Future<Either<Failure, UserModel>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await service.login(email, password);
      if (response.statusCode == 200) {
        return Right(UserModel.fromJson(response.data));
      }
      return Left(Failure(response.data["message"]));
    } on DioException catch (e) {
      return Left(Failure(e.response?.data['message'] ?? 'Login failed'));
    } catch (e) {
      return Left(Failure());
    }
  }

  Future<Either<Failure, String>> otpRequest(String email) async {
    try {
      final response = await service.otpRequest(email);
      if (response.statusCode == 200) {
        return Right(response.data["message"]);
      }
      return Left(Failure(response.data["message"]));
    } on DioException catch (e) {
      return Left(Failure(e.response?.data['message'] ?? 'Request failed'));
    } catch (e) {
      return Left(Failure());
    }
  }

  Future<Either<Failure, String>> verifyOtp(String email, String otp) async {
    try {
      final response = await service.verifyOtp(email, otp);
      if (response.statusCode == 200) {
        return Right(response.data["message"]);
      }
      return Left(Failure(response.data["message"]));
    } on DioException catch (e) {
      return Left(Failure(e.response?.data['message'] ?? 'Request failed'));
    } catch (e) {
      return Left(Failure());
    }
  }
}
