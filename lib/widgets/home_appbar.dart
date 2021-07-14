import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greenapp/app/app.dart';
import 'package:greenapp/constants.dart';
import 'package:provider/provider.dart';

AppBar HomeAppBar(Widget title) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    title: title,
    centerTitle: true,
    actions: <Widget>[
      PopupMenuButton(
        child: Padding(
          padding: const EdgeInsets.only(right: 45.0),
          child: SvgPicture.asset('assets/svgs/more.svg'),
        ),
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            key: const Key('homePage_logout_iconButton'),
            child: ListTile(
              dense: true,
              leading: const Icon(Icons.exit_to_app),
              title: Text('Logout'),
            ),
            onTap: () => context.read<AppBloc>().add(AppLogoutRequested()),
          ),
        ],
      )
    ],
  );
}
