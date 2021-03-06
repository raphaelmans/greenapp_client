import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:greenapp/app/app.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/src/provider.dart';

class Achievements extends StatelessWidget {
  const Achievements({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const Achievements());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: HomeAppBar(
        Text(
          'Achievements',
          style: kIntroHeadingStyle(context),
        ),
        implyLeading: true,
      ),
      body: View(),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kBodyPadding.copyWith(top: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UserLevel(),
          SizedBox(
            height: 5,
          ),
          Text(
            'Starter',
            style: kIntroHeadingStyle(context),
          ),
          Divider(
            thickness: 2.0,
          ),
          SizedBox(
            height: 10,
          ),
          BadgeContainer(),
        ],
      ),
    );
  }
}

class UserLevel extends StatelessWidget {
  const UserLevel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<Map<String, dynamic>?> getUserDetails() async {
      final docRef = await FirebaseFirestore.instance
          .collection('users')
          .doc(context.read<AppBloc>().state.user.id)
          .get();

      return docRef.data();
    }

    return FutureBuilder(
      future: getUserDetails(),
      builder: (context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
        if (snapshot.hasData) {
          num exp = snapshot.data!['exp'];
          num level = (exp / 100) < 1 ? 1 : (exp / 100);
          num progress = (exp % 100) / 100;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularPercentIndicator(
                radius: 120,
                progressColor: Theme.of(context).primaryColor,
                percent: progress.toDouble(),
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      level.toInt().toString(),
                      style: kIntroHeadingStyle(context),
                    ),
                    Text('Level'),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
                width: double.infinity,
              ),
              Text('${(progress * 100).toInt()}/100 EXP'),
            ],
          );
        }
        return Text('...loading');
      },
    );
  }
}

class BadgeContainer extends StatelessWidget {
  const BadgeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Badge(),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Eco Warrior',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'Donate 4 more',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xff6E7191)),
            ),
            SizedBox(
              height: 5.0,
            ),
            LinearPercentIndicator(
              progressColor: Theme.of(context).primaryColor,
              width: 150.0,
              percent: .2,
              lineHeight: 20.0,
            )
          ],
        )
      ],
    );
  }
}

class Badge extends StatelessWidget {
  const Badge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Color(0xff5AB1F6),
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0, 4.0),
              blurRadius: 4.0,
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/profile/warrior.png'),
            Text(
              '1/5',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
