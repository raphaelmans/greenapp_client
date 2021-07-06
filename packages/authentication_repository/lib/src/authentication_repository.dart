import 'dart:async';
import 'package:authentication_api/authentication_api.dart';
import 'package:authentication_repository/src/models/models.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class LogInWithEmailAndPasswordFailure implements Exception {}

class AuthenticationRepository {
  AuthenticationRepository({AuthenticationApi? authenticationApi})
      : _authenticationApi = authenticationApi ?? AuthenticationApi();

  final AuthenticationApi _authenticationApi;
  final _authController = StreamController<AuthenticationStatus>();
  final _userController = StreamController<User>();
  User _user = User.empty;

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _authController.stream;
  }

  User get getUser {
    return _user.isNotEmpty ? _user : User.empty;
  }

  Stream<User> get user async* {
    yield* _userController.stream;
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserApi userApi =
          await _authenticationApi.loginEmailPassword(email, password);
      _user = User(
          id: userApi.user.id,
          email: userApi.user.email,
          token: userApi.token,
          name: userApi.user.name);
      _authController.add(AuthenticationStatus.authenticated);
      _userController.add(getUser);
    } catch (e) {
      print(e);
      throw LogInWithEmailAndPasswordFailure();
    }
  }

  void logOut() {
    _user = User.empty;
    _authController.add(AuthenticationStatus.unauthenticated);
    _userController.add(User.empty);
  }

  void dispose() => _authController.close();
}
