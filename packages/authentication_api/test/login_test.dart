import 'package:authentication_api/src/authentication_api.dart';
import 'package:authentication_api/src/models/models.dart';

void main() async {
  AuthenticationApi ap = AuthenticationApi();
  UserApi user =
      await ap.loginEmailPassword('raphaelmansueto@gmail.com', '123456');

  print(user.user.email);
}
