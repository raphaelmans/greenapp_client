import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greenapp/app/app.dart';
import 'package:provider/src/provider.dart';

AppBar ShopAppBar({required Widget title, onPressed}) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    title: title,
    centerTitle: true,
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset('assets/svgs/cart.svg'),
        onPressed: () => onPressed(),
      ),
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
      ),
    ],
  );
}
