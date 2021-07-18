import 'package:flutter/material.dart';
import 'package:greenapp/constants.dart';

import '../widgets.dart';

class PaymentOptionSection extends StatelessWidget {
  const PaymentOptionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment Option',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Cash on Delivery',
                style: kDetailsHeadingStyle(context).copyWith(fontSize: 12.0),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Merchandise Subtotal',
              ),
              Text(
                '\$100',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping Subtotal',
              ),
              Text(
                '\$20',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
