import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
    const imageLink =
        'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=976&q=80';
    List<UserGamer> gamers = [
      UserGamer('Gary Senoc', 100, 0,
          imgSrc:
              'https://images.unsplash.com/photo-1599110906447-f38264a9c345?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODB8fHVzZXIlMjBhbm9ueW1vdXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
      UserGamer('Ada Villacarlos', 99, 25,
          imgSrc:
              'https://images.unsplash.com/photo-1508008887277-48ea0219055b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fHVzZXIlMjBhbm9ueW1vdXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
      UserGamer('Mel Gabutan', 90, 80,
          imgSrc:
              'https://images.unsplash.com/photo-1599110364762-eba33ec21988?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nzl8fHVzZXIlMjBhbm9ueW1vdXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
      UserGamer('Adrian Aguillar', 45, 99,
          imgSrc:
              'https://images.unsplash.com/photo-1503027534918-08897e434533?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTJ8fHVzZXIlMjBhbm9ueW1vdXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
      UserGamer('Raphael Mansueto', 1, 50, imgSrc: imageLink),
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: kBodyPadding.copyWith(top: 45),
        child: Column(
          children: [
            ...gamers.map(
              (g) => UserItem(
                userGamer: g,
                rank: gamers.indexOf(g),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  const UserItem({Key? key, required this.userGamer, required this.rank})
      : super(key: key);

  final num rank;
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
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${(rank + 1).toString()}.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(userGamer.imgSrc ??
                            'https://images.unsplash.com/photo-1530454967024-e06113b424a9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1048&q=80'),
                      ),
                    ),
                  ),
                ],
              ),
              title: Text(
                userGamer.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
              trailing: Text(
                'Level ${userGamer.level.toString()}',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
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
  final String? imgSrc;

  UserGamer(this.name, this.level, this.exp, {this.imgSrc});
}
