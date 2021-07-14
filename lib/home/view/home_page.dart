import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greenapp/app/app.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
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
        child: HomeView(),
      ),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 4.0),
          Text(user.email ?? '', style: textTheme.headline6),
          const SizedBox(height: 4.0),
          Text(user.name ?? '', style: textTheme.headline5),
        ],
      ),
    );
  }
}
