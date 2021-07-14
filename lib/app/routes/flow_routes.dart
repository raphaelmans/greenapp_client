import 'package:flutter/widgets.dart';
import 'package:greenapp/app/app.dart';
import 'package:greenapp/home/home.dart';
import 'package:greenapp/intro/intro.dart';
import 'package:greenapp/login/login.dart';
import 'package:greenapp/navigation/navigation.dart';
import 'package:greenapp/profile/profile.dart';

List<Page> onGenerateAppViewPages(AppState state, List<Page<dynamic>> pages) {
  switch (state.status) {
    case AppStatus.authenticated:
      return [
        HomePage.page(),
        if (state.screen == NavScreen.profile) ProfilePage.page()
      ];
    case AppStatus.unauthenticated:
      return [LoginPage.page(), IntroPage.page()];
    default:
      return [IntroPage.page()];
  }
}
