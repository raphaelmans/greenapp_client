import 'package:flutter/material.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';
import '../widgets/widgets.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: CommunityPage());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const CommunityPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: HomeAppBar(
        Text(
          'Home',
          style: kIntroHeadingStyle(context),
        ),
      ),
      body: const HomeBG(
        child: CommunityView(),
      ),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}

class CommunityView extends StatelessWidget {
  const CommunityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getPageTextLabel('What do you want to know\nToday?'),
        Expanded(child: ActionButtons()),
      ],
    );
  }
}
