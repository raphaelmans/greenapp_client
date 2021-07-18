import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      key: Key(
        'address_section_place_order',
      ),
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Icon(Icons.pin_drop_outlined),
              )),
          SizedBox(
            width: 5,
          ),
          RichText(
            text: TextSpan(
                text: 'Delivery Address\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 11.0,
                  height: 1.3,
                ),
                children: [
                  TextSpan(text: 'Ada Pauline Villacarlos | +(63) 123 456\n'),
                  TextSpan(text: 'Lorem Lorem\n'),
                  TextSpan(text: 'Lorem Ipsum, Luzon Palawan 1234'),
                ]),
          ),
          Spacer(),
          Align(
            alignment: Alignment.center,
            child: Icon(FontAwesomeIcons.caretRight),
          ),
        ],
      ),
    );
  }
}
