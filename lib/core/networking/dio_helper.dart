
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/networking/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;

  static initDio() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );

    dio!.interceptors.add(PrettyDioLogger());
  }

  static getRequest({
    required String endPoint,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    try {
      Response response = await dio!.get(
        endPoint,
        queryParameters: query,
        options: options,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  static postRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await dio!.post(endPoint, data: data);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
