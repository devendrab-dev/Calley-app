import 'package:calley/features/Dashboard/data/models/test_model.dart';
import 'package:calley/features/Dashboard/data/services/data_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:dio/dio.dart';

class Failure {
  final String message;
  Failure([this.message = "Unexpected Error"]);
}

class DataRepository {
  final DataService service;
  DataRepository(this.service);

  Future<Either<Failure, CallData>> list() async {
    try {
      final response = await service.list();
      if (response.statusCode == 200) {
        return Right(CallData.fromJson(response.data));
      }
      return Left(Failure(response.data["message"]));
    } on DioException catch (e) {
      return Left(Failure(e.response?.data['message'] ?? 'Signup failed'));
    } catch (e) {
      return Left(Failure());
    }
  }
}
