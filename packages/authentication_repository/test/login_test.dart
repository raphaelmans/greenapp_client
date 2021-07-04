import 'package:authentication_repository/authentication_repository.dart';

main(List<String> args) async {
  AuthenticationRepository authenticationRepository =
      AuthenticationRepository();

  authenticationRepository.status.listen((event) {
    print(event);
  });

  await Future<void>.delayed(const Duration(seconds: 1));
  authenticationRepository.logInWithEmailAndPassword(
      email: 'raphaelmansueto@gmail.com', password: '123456');

  dynamic user = await authenticationRepository.getUser();

  print(user?.email);
  authenticationRepository.logOut();
  await Future<void>.delayed(const Duration(seconds: 1));
  user = await authenticationRepository.getUser();
  print(user?.email);
}
