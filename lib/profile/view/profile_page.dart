import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenapp/app/app.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/home/home.dart';
import 'package:greenapp/profile/view/achievements.dart';
import 'package:greenapp/profile/view/leaderboards.dart';
import 'package:greenapp/profile/view/rewards_page.dart';
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
    Future<Map<String, dynamic>?> getUserDetails() async {
      final docRef = await FirebaseFirestore.instance
          .collection('users')
          .doc(context.read<AppBloc>().state.user.id)
          .get();

      return docRef.data();
    }

    final String? name = context.read<AppBloc>().state.user.name;
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
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Raphael',
                style: textTheme.headline6!.copyWith(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  overflow: TextOverflow.fade,
                ),
              ),
              Text(
                'Mansueto',
                style: textTheme.headline6!.copyWith(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w900,
                  color: Color(0xff6E7191),
                  overflow: TextOverflow.fade,
                ),
              ),
              FutureBuilder(
                future: getUserDetails(),
                builder:
                    (context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
                  if (snapshot.hasData) {
                    num exp = snapshot.data!['exp'];
                    num? greenpoints = snapshot.data!['greenPoints'];
                    num level = (exp / 100) < 1 ? 1 : (exp / 100);
                    num progress = (exp % 100) / 100;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Green Points: ',
                                  style: TextStyle(
                                    color: Colors.black,
                                  )),
                              TextSpan(
                                text: greenpoints != null
                                    ? greenpoints.toInt().toString()
                                    : '0',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5),
                              )
                            ],
                          ),
                        ),
                        Text(
                          'Level ${level.toInt()}',
                          style: textTheme.headline6!
                              .copyWith(height: 1.5, fontSize: 16.0),
                        ),
                        SizedBox(height: 5.0),
                        LinearPercentIndicator(
                          padding: EdgeInsets.only(left: 8.0),
                          width: 140.0,
                          lineHeight: 14.0,
                          percent: progress.toDouble(),
                          progressColor: Color(0xFF40B861),
                        )
                      ],
                    );
                  }
                  return Text('...loading');
                },
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
          onPressed: () => Navigator.of(context).push(Achievements.route()),
        ),
        AppCard(
          child: AppCardContent(
            text: 'Rewards',
            icon: Image.asset('assets/profile/medal.png'),
          ),
          onPressed: () => Navigator.of(context).push(RewardsPage.route()),
        ),
        AppCard(
          child: AppCardContent(
            text: 'Leaderboards',
            icon: SvgPicture.asset('assets/profile/progress.svg'),
          ),
          onPressed: () => Navigator.of(context).push(Leaderboards.route()),
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
