import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({Key? key, required this.child}) : super(key: key);
  final child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 150,
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
          onTap: () => null,
          child: child,
        ),
      ),
    );
  }
}
