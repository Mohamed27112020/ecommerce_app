import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/networking/api_endpoints.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/features/AuthScreen/Auth_models/Authmodel.dart';

class Repoauth {
  
  Future<Either<String, TokenModel>> login({
    required String username,
    required String password,
  }) async {

    try {
      Response response = await DioHelper.postRequest(
        endPoint: ApiEndpoints.auth_login,
        data: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        print(response.data);
        return Right(TokenModel.fromJson(response.data));
      } else {
        return Left(response.data['message']);
        print(response.data);
      }
    } on DioError catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
