import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greenapp/app/app.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/information/view/view.dart';
import 'package:greenapp/scan_ai/views/views.dart';
import 'package:greenapp/widgets/widgets.dart';
import '../widgets/action_buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 4.0),
        getPageTextLabel('What do you want to recycle\ntoday?'),
        SizedBox(
          height: 5,
        ),
        SearchBar(),
        SizedBox(
          height: 20,
        ),
        Expanded(child: ActionButtons()),
      ],
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String searchValue = '';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                focusColor: Theme.of(context).primaryColor,
                prefixIcon: Icon(Icons.search, color: Colors.black),
                hintText: 'Search'),
            onChanged: (value) {
              setState(() {
                searchValue = value;
              });
            },
            onSubmitted: (value) {
              if (value == 'plastic') {
                Navigator.of(context).push(InfromationDetailPage.route());
              }
            },
          ),
        ),
        SizedBox(
          width: 20,
        ),
        IconButton(
            onPressed: () => Navigator.of(context).push(ScanAI.route()),
            icon: Icon(FontAwesomeIcons.camera,
                color: Theme.of(context).primaryColor))
      ],
    );
  }
}
