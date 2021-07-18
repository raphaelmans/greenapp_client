import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton(
      {Key? key,
      required this.iconData,
      required this.onPressed,
      this.width,
      this.height,
      this.iconSize})
      : super(key: key);

  final IconData iconData;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40,
      width: width ?? 40,
      child: TextButton(
        child: Icon(
          iconData,
          color: Colors.black,
          size: iconSize ?? 16.0,
        ),
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Color(0xffEFF0F6),
        ),
      ),
    );
  }
}
