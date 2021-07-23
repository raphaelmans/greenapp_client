import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenapp/community/community.dart';
import 'package:greenapp/constants.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ConfirmationPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
          padding: kBodyPadding.copyWith(top: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
              ),
              SvgPicture.asset('assets/svgs/congrats.svg'),
              Text(
                'Thank you for donating.',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
              Spacer(),
              TextButton(
                onPressed: () => Navigator.of(context)
                    .pushReplacement(CommunityPage.route()),
                child: Text('Back to Community',
                    style: TextStyle(
                        color: Color(0xff40B861),
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0)),
                style: TextButton.styleFrom(backgroundColor: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
