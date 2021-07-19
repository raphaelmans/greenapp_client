import 'package:flutter/material.dart';
import 'package:greenapp/community_admin/widgets/widgets.dart';
import 'package:greenapp/constants.dart';

class CommunitySetupPage extends StatelessWidget {
  const CommunitySetupPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: CommunitySetupPage());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const CommunitySetupPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommunitySetupView(),
    );
  }
}

class CommunitySetupView extends StatelessWidget {
  const CommunitySetupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kBodyPadding.copyWith(top: 45, bottom: 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,\nSet up your Community',
                style: kIntroHeadingStyle(context),
              ),
              CommunityForm()
            ],
          ),
        ),
      ),
    );
  }
}
