import 'package:dio/dio.dart';

class GreenAppApi {
  GreenAppApi() : dio = Dio(options);
  static const _baseUrl = 'http://192.168.1.12:5000/api/v1/auth';
  static BaseOptions options = BaseOptions(
    baseUrl: _baseUrl,
  );
  Dio dio;
}
