import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "http://127.0.0.1:8000/api/",
      headers: {
        "Accept": 'application/json',
      },
      responseType: ResponseType.json,
      receiveTimeout: 300000,
      connectTimeout: 500000,
      followRedirects: false,
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
    ));
  }

  static Future<Response> post(
      {required String url,
      Map<String, dynamic>? query,
      Map<String, dynamic>? body}) async {
    return await dio!.post(url, queryParameters: query, data: body);
  }
}
