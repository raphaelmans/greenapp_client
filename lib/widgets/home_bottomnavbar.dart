import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenapp/app/app.dart';
import 'package:greenapp/home/home.dart';
import 'package:greenapp/navigation/navigation.dart';
import 'package:greenapp/profile/profile.dart';
import 'package:provider/provider.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({
    Key? key,
  }) : super(key: key);

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
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset('assets/svgs/home.svg'),
            onPressed: () {
              context.read<NavCubit>().navigateTo(NavScreen.home);
            },
          ),
          IconButton(
            icon: SvgPicture.asset('assets/svgs/profile.svg'),
            onPressed: () {
              context.read<NavCubit>().navigateTo(NavScreen.profile);
            },
          ),
        ],
      ),
    );
  }
}
