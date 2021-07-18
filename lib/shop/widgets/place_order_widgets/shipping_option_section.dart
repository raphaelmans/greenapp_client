import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:greenapp/constants.dart';

import '../widgets.dart';

class ShippingOptionSection extends StatelessWidget {
  const ShippingOptionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          color: Color(0xffF2FFFB),
          border: Border(
            top: BorderSide(
                color: Theme.of(context).primaryColorDark, width: 3.0),
            bottom: BorderSide(
                color: Theme.of(context).primaryColorDark, width: 3.0),
          )),
      child: SectionContainer(
        key: Key(
          'payment_section_place_order',
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shipping Option',
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Standard Local',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Standard Shipping',
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Receive by 18 Jul - 25 Jul',
                  style: kDetailsHeadingStyle(context).copyWith(fontSize: 12.0),
                ),
              ],
            ),
            Spacer(),
            Text(
              '\$20',
              style: kDetailsHeadingStyle(context).copyWith(fontSize: 17.0),
            )
          ],
        ),
      ),
    );
  }
}
