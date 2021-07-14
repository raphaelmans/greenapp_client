import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';
import 'package:greenapp/login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginPage());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: IconButton(
            icon: SvgPicture.asset(
              'assets/svgs/return.svg',
            ),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: DefaultBG(
        child: Padding(
          padding: kBodyPadding,
          child: BlocProvider(
            create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
            child: const LoginForm(),
          ),
        ),
      ),
    );
  }
}
