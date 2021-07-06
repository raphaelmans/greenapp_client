import 'package:authentication_repository/authentication_repository.dart';

main(List<String> args) async {
  AuthenticationRepository authenticationRepository =
      AuthenticationRepository();

  authenticationRepository.status.listen((event) {
    print(event);
  });
  authenticationRepository.user.listen((event) {
    print("USER HAS CHANGED: " + event.email.toString());
  });

  await Future<void>.delayed(const Duration(seconds: 1));
  authenticationRepository.logInWithEmailAndPassword(
      email: 'raphaelmansueto@gmail.com', password: 'Gwapoko123');

  dynamic user = authenticationRepository.getUser;

  print(user?.email);
  await Future<void>.delayed(const Duration(seconds: 1));
  authenticationRepository.logOut();
  await Future<void>.delayed(const Duration(seconds: 1));
  user = authenticationRepository.getUser;
  print(user?.email);
}
