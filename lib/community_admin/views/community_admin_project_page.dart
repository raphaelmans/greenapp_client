import 'package:flutter/material.dart';
import 'package:greenapp/community_admin/views/community_project_create.dart';
import 'package:greenapp/community_admin/widgets/widgets.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';

class CommunityAdminProjectPage extends StatelessWidget {
  const CommunityAdminProjectPage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => CommunityAdminProjectPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        Text(
          'Projects',
          style: kIntroHeadingStyle(context),
        ),
      ),
      body: CommunityAdminView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).push(CommunityProjectCreate.route()),
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
      ),
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
          getPageTextLabel('What do you want to check today?'),
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
