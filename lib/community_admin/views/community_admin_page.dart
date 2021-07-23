import 'package:flutter/material.dart';
import 'package:greenapp/community_admin/widgets/widgets.dart';
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
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class CommunityAdminView extends StatelessWidget {
  const CommunityAdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kBodyPadding.copyWith(top: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getPageTextLabel('What do you want to see today?'),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ProjectLayout(),
          ),
        ],
      ),
    );
  }
}
