import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenapp/app/bloc/user_bloc.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/home/home.dart';
import 'package:greenapp/widgets/home_bg.dart';
import 'package:greenapp/widgets/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/src/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: ProfilePage());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: HomeAppBar(
        Text(
          'Profile',
          style: kIntroHeadingStyle(context),
        ),
      ),
      body: HomeBG(
        child: ProfileView(),
      ),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageLink =
        'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=976&q=80';
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProfileDetails(imageLink: imageLink, textTheme: textTheme),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: ActionButtons(),
        ),
      ],
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    Key? key,
    required this.imageLink,
    required this.textTheme,
  }) : super(key: key);

  final String imageLink;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final String? name = context.read<UserBloc>().state.user.name;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageLink),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                child: Text(
                  name ?? 'error',
                  style: textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
              // Text(
              //   'Doe',
              //   style: textTheme.headline6!.copyWith(
              //     fontWeight: FontWeight.w400,
              //     color: Color(0xFF6E7191),
              //   ),
              // ),
              Text(
                'Level 1',
                style: textTheme.headline6!.copyWith(height: 1.5),
              ),
              SizedBox(height: 5.0),
              LinearPercentIndicator(
                padding: EdgeInsets.only(left: 8.0),
                width: 150.0,
                lineHeight: 14.0,
                percent: 0.2,
                progressColor: Color(0xFF40B861),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 25.0,
      crossAxisSpacing: 25.0,
      clipBehavior: Clip.none,
      children: [
        AppCard(
          child: AppCardContent(
            text: 'Profile',
            icon: Image.asset('assets/profile/profile.png'),
          ),
        ),
        AppCard(
          child: AppCardContent(
            text: 'Achievements',
            icon: Image.asset('assets/profile/achievements.png'),
          ),
        ),
        AppCard(
          child: AppCardContent(
            text: 'Progress',
            icon: SvgPicture.asset(
              'assets/profile/progress.svg',
            ),
          ),
        ),
        AppCard(
          child: AppCardContent(
            text: 'Progress',
            icon: SvgPicture.asset(
              'assets/profile/progress.svg',
            ),
          ),
        ),
      ],
    );
  }
}

class AppCardContent extends StatelessWidget {
  const AppCardContent({
    Key? key,
    this.icon,
    this.text,
  }) : super(key: key);

  final icon;
  final text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        icon,
        Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF6E7191),
            fontWeight: FontWeight.w800,
          ),
        )
      ],
    );
  }
}
