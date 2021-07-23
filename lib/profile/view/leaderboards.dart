import 'package:flutter/material.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';

class Leaderboards extends StatelessWidget {
  const Leaderboards({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const Leaderboards());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: HomeAppBar(
        Text(
          'Leaderboards',
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
    List<UserGamer> gamers = [
      UserGamer('Gary Senoc', 100, 0),
      UserGamer('Ada Villacarlos', 99, 25),
      UserGamer('Mel Gabutan', 90, 80),
      UserGamer('Raphael Mansueto', 50, 20),
      UserGamer('Adrian Aguillar', 45, 99),
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: kBodyPadding.copyWith(top: 45),
        child: Column(
          children: [
            ...gamers.map((g) => UserItem(userGamer: g)),
          ],
        ),
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  const UserItem({Key? key, required this.userGamer}) : super(key: key);

  final UserGamer userGamer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffDBDBDB),
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: ListTile(
              title: Text(
                userGamer.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
              trailing: Text(
                'Level ${userGamer.level.toString()}',
                style: TextStyle(color: Color(0xffED2E7E), fontSize: 14.0),
              ),
              subtitle: Text('${userGamer.exp.toString()} / 100 EXP'),
            )),
      ),
    );
  }
}

class UserGamer {
  final String name;
  final num level;
  final num exp;

  UserGamer(this.name, this.level, this.exp);
}
