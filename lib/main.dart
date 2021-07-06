import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:greenapp/app/app.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  final authenticationRepository = AuthenticationRepository();
  runApp(App(
    authenticationRepository: authenticationRepository,
  ));
}
