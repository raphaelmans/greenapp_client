import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/shop/widgets/widgets.dart';
import 'package:greenapp/widgets/widgets.dart';

class PlaceOrderPage extends StatelessWidget {
  const PlaceOrderPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: PlaceOrderPage());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const PlaceOrderPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        Text(
          'Cart',
          style: kIntroHeadingStyle(context),
        ),
      ),
      body: PlaceOrderView(),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}

class PlaceOrderView extends StatelessWidget {
  const PlaceOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          //address
          SectionDivider(),
          AddressSection(),
          //items
          SectionDivider(),
          ItemSection(),
          //shipping option

          //payment option
          ShippingOptionSection(),

          PaymentOptionSection(),
          SectionDivider(),
          Padding(
            padding: kBodyPadding.copyWith(bottom: 0, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Total Payment: ',
                  style: kIntroHeadingStyle(context).copyWith(fontSize: 18.0),
                ),
                Text(
                  '\$120',
                  style: kPriceTextStyle.copyWith(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60.0,
          ),
          TextButton(
            child: Text('Place Order'),
            onPressed: () => null,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class SectionDivider extends StatelessWidget {
  const SectionDivider({Key? key, this.color, this.thickness})
      : super(key: key);

  final Color? color;
  final double? thickness;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? Theme.of(context).primaryColor,
      thickness: thickness ?? 1.0,
    );
  }
}
