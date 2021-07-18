import 'package:flutter/widgets.dart';
import 'package:greenapp/app/app.dart';
import 'package:greenapp/community/community.dart';
import 'package:greenapp/home/home.dart';
import 'package:greenapp/intro/intro.dart';
import 'package:greenapp/login/login.dart';
import 'package:greenapp/navigation/navigation.dart';
import 'package:greenapp/profile/profile.dart';
import 'package:greenapp/shop/shop.dart';

List<Page> onGenerateAppViewPages(AppState state, List<Page<dynamic>> pages) {
  switch (state.status) {
    case AppStatus.authenticated:
      return [
        HomePage.page(),
        if (state.screen == NavScreen.profile)
          ProfilePage.page()
        else if (state.screen == NavScreen.community)
          CommunityPage.page()
        else if (state.screen == NavScreen.shop)
          ShopPage.page()
      ];
    case AppStatus.unauthenticated:
      return [LoginPage.page(), IntroPage.page()];
    default:
      return [IntroPage.page()];
  }
}
