import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:greenapp/app/app.dart';
import 'package:firebase_core/firebase_core.dart';

import 'navigation/navigation.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;
  final navCubit = NavCubit();
  runApp(App(
    authenticationRepository: authenticationRepository,
    navCubit: navCubit,
  ));
}
