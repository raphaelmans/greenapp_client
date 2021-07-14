import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/login/login.dart';
import 'package:greenapp/sign_up/sign_up.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: IntroPage());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const IntroPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: kBodyPadding,
        child: IntroView(),
      ),
    );
  }
}

class IntroView extends StatelessWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/images/logo.png'),
          SvgPicture.asset('assets/svgs/intro_1.svg'),
          Container(
            width: double.infinity,
            child: RichText(
              text: TextSpan(
                text: 'Paste Your Waste\n',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold, color: Color(0xff37474F)),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        'Learn to color your life green\njust within your fingertips.',
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
            ),
          ),
          Spacer(),
          TextButton(
            child: Text('Sign In'),
            onPressed: () =>
                Navigator.of(context).push<void>(LoginPage.route()),
          ),
          SizedBox(height: 18.0),
          TextButton(
            child: Text('Sign Up'),
            onPressed: () =>
                Navigator.of(context).push<void>(SignUpPage.route()),
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              onSurface: Colors.green,
              primary: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
