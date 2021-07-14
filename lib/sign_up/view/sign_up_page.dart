import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';
import 'package:greenapp/sign_up/sign_up.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/svgs/return.svg'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: DefaultBG(
        child: Padding(
          padding: kBodyPadding,
          child: BlocProvider<SignUpCubit>(
            create: (_) =>
                SignUpCubit(context.read<AuthenticationRepository>()),
            child: const SignUpForm(),
          ),
        ),
      ),
    );
  }
}
