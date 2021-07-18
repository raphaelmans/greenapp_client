import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    Key? key,
    required this.child,
    this.onPressed,
    this.height,
    this.width,
  }) : super(key: key);
  final child;
  final onPressed;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 150,
      width: width ?? 150,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            offset: Offset(0, 4.0),
            blurRadius: 4.0,
            spreadRadius: 0,
          )
        ],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.0),
          onTap: onPressed,
          child: child,
        ),
      ),
    );
  }
}
