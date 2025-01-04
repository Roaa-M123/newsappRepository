import 'package:dio/dio.dart';
import 'package:newsapp/core/network/end_points.dart';


class DioHelper {
  static late Dio _dio;
  static void initDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
      ),
    );
  }

  static Future<Response> getData({
    required String endPointpath,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response response =
        await _dio.get(endPointpath, queryParameters: queryParameters);
    return response;
  }

  static Future<Response> postData({
    required String endPointpath,
    Map<String, dynamic>? data,
  }) async {
    final Response response = await _dio.post(
      endPointpath,
      data: data,
    );
    return response;
  }
}
