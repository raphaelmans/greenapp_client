import 'package:flutter/material.dart';

kIntroHeadingStyle(context) => Theme.of(context).textTheme.headline5!.copyWith(
      color: Color(0xff37474F),
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

const kBodyPadding = EdgeInsets.only(left: 45.0, right: 45.0, bottom: 45.0);

kDetailsHeadingStyle(context) =>
    Theme.of(context).textTheme.headline5!.copyWith(
          color: Color(0xff6E7191),
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
        );

const kPriceTextStyle = TextStyle(
  color: Color(0xff6AAD7D),
  fontSize: 18.0,
);
