import 'package:flutter/material.dart';
import 'package:greenapp/constants.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    Key? key,
    this.height,
    this.child,
    this.backgroundColor,
    this.padding,
  }) : super(key: key);

  final double? height;
  final Widget? child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? kBodyPadding.copyWith(bottom: 0, top: 0),
      child: Container(
        height: height ?? 120,
        color: backgroundColor,
        child: child,
      ),
    );
  }
}
