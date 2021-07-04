import 'dart:async';

import 'package:authentication_api/authentication_api.dart';
import 'package:authentication_repository/src/models/models.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class LogInWithEmailAndPasswordFailure implements Exception {}

class AuthenticationRepository {
  AuthenticationRepository({AuthenticationApi? authenticationApi})
      : _authenticationApi = authenticationApi ?? AuthenticationApi();

  final AuthenticationApi _authenticationApi;
  final _controller = StreamController<AuthenticationStatus>();
  User _user = User.empty;

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<User?> getUser() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (_user.isNotEmpty) return _user;
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
      _controller.add(AuthenticationStatus.authenticated);
    } on Exception {
      throw LogInWithEmailAndPasswordFailure();
    }
  }

  void logOut() {
    _user = User.empty;
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
