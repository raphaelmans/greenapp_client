import 'package:flutter/material.dart';

class GAListItem extends StatelessWidget {
  const GAListItem({Key? key, required this.onPressed, this.text})
      : super(key: key);

  final String? text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xffDBDBDB),
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              text ?? '',
              style: TextStyle(
                color: Color(0xff6E7191),
                fontWeight: FontWeight.w600,
              ),
            ),
          ), //TODO: dynamic text
        ),
      ),
    );
  }
}
