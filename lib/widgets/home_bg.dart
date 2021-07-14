import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenapp/constants.dart';

class HomeBG extends StatelessWidget {
  const HomeBG({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: Alignment.center,
        child: SvgPicture.asset('assets/svgs/plant_home_bg.svg',
            fit: BoxFit.cover, semanticsLabel: 'Green Plant Background'),
      ),
      Padding(
        padding: kBodyPadding,
        child: child,
      ),
    ]);
  }
}
