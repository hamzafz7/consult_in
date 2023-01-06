import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "http://192.168.1.105:8000/api/",
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
      var body,
      Map<String, dynamic>? header}) async {
    return await dio!.post(url,
        queryParameters: query, data: body, options: Options(headers: header));
  }
}
