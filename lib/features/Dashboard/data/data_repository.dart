import 'package:calley/features/Dashboard/data/models/list_model.dart';
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

  Future<Either<Failure, CallData>> list(String id) async {
    try {
      final response = await service.list(id);
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

  Future<Either<Failure, GetListModel>> getlist(String id) async {
    try {
      final response = await service.getlist(id);
      if (response.statusCode == 200) {
        return Right(GetListModel.fromJson(response.data));
      }
      return Left(Failure(response.data["message"]));
    } on DioException catch (e) {
      return Left(Failure(e.response?.data['message'] ?? 'Signup failed'));
    } catch (e) {
      return Left(Failure());
    }
  }
}
