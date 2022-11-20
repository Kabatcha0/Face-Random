import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "https://fakeface.rest/", receiveDataWhenStatusError: false));
  }

  static Future<Response> getData(Map<String, dynamic> query) async {
    return await dio.get("face/json", queryParameters: query);
  }
}
