import 'package:flutter/material.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';

class CommunityAdminPage extends StatelessWidget {
  const CommunityAdminPage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => CommunityAdminPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        Text(
          'Home',
          style: kIntroHeadingStyle(context),
        ),
      ),
      body: CommunityAdminView(),
    );
  }
}

class CommunityAdminView extends StatelessWidget {
  const CommunityAdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
