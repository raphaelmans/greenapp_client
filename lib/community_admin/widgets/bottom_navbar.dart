import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenapp/community_admin/views/community_admin_project_page.dart';
import 'package:greenapp/community_admin/views/community_transaction_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(color: Color(0xFFE0E0E0)),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: SvgPicture.asset('assets/svgs/community.svg'),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(CommunityTransactionPage.route());
            },
          ),
          IconButton(
            icon: SvgPicture.asset('assets/svgs/event.svg'),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(CommunityAdminProjectPage.route());
            },
          ),
        ],
      ),
    );
  }
}
