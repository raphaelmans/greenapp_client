import 'package:flutter/widgets.dart';
import 'package:greenapp/app/app.dart';
import 'package:greenapp/home/home.dart';
import 'package:greenapp/login/login.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
    default:
      return [LoginPage.page()];
  }
}
