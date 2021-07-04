import 'package:dio/dio.dart';

class GreenAppApi {
  GreenAppApi() : dio = Dio(options);
  static const _baseUrl = 'http://localhost:5000/api/v1/auth';
  static BaseOptions options = BaseOptions(
    baseUrl: _baseUrl,
  );
  Dio dio;
}
