import 'package:flutter/material.dart';
import 'package:greenapp/constants.dart';

import '../widgets.dart';

class ItemSection extends StatelessWidget {
  const ItemSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      key: Key('items_section_place_order'),
      padding: kBodyPadding.copyWith(bottom: 10.0),
      height: 100,
      child: Row(
        children: [
          Image.asset(
            'assets/shop/item.png',
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Bamboo Pen\n',
                style: kDetailsHeadingStyle(context).copyWith(
                  fontSize: 17.0,
                ),
                children: [
                  TextSpan(text: '\$50'),
                ]),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'x2',
              style: kDetailsHeadingStyle(context).copyWith(fontSize: 17.0),
            ),
          ),
        ],
      ),
    );
  }
}
