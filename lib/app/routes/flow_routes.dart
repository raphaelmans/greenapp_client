import 'package:flutter/widgets.dart';
import 'package:greenapp/app/app.dart';
import 'package:greenapp/home/home.dart';
import 'package:greenapp/intro/intro.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
    default:
      return [IntroPage.page()];
  }
}
