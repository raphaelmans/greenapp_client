import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultBG extends StatelessWidget {
  const DefaultBG({
    Key? key,
    this.child,
  }) : super(key: key);

  final child;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: SvgPicture.asset('assets/svgs/crop_plant.svg',
            fit: BoxFit.cover, semanticsLabel: 'Green Plant Background'),
      ),
      child,
    ]);
  }
}
