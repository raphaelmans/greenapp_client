import 'package:authentication_api/src/models/models.dart';
import 'package:dio/dio.dart';
import 'package:greenapp_api/greenapp_api.dart';

class AuthenticationApi {
  AuthenticationApi({Dio? dio}) : _dio = dio ?? GreenAppApi().dio;

  final Dio _dio;

  Future<UserApi> loginEmailPassword(String email, String password) async {
    Response req = await _dio.post('/login',
        data: {'email': email, 'password': password},
        options: Options(responseType: ResponseType.json));

    UserApi user = UserApi.fromJson(req.data);

    return user;
  }
}
