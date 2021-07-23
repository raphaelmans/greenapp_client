import 'package:flutter/material.dart';

class StyledContainer extends StatelessWidget {
  const StyledContainer({Key? key, required this.child, this.width})
      : super(key: key);

  final Widget child;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffDBDBDB),
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: child,
      ),
    );
  }
}
