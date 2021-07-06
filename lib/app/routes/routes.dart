import 'package:flutter/material.dart';
import 'package:greenapp/home/home.dart';
import 'package:greenapp/login/login.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.route:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case HomePage.route:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(builder: (_) => const LoginPage());
    }
  }
}
