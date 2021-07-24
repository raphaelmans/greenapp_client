import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/shop/view/place_order_page.dart';
import 'package:greenapp/shop/widgets/widgets.dart';
import 'package:greenapp/widgets/widgets.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: CartPage());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const CartPage());
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
      body: CartView(),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kBodyPadding.copyWith(bottom: 20.0),
      child: Column(
        children: [
          CartItem(),
          Spacer(),
          RichText(
            text: TextSpan(
                text: 'Subtotal: ',
                style: TextStyle(
                  color: Color(0xff6E7191),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(text: '\$100', style: kPriceTextStyle),
                ]),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextButton(
            child: Text('Checkout'),
            onPressed: () =>
                Navigator.of(context).push<void>(PlaceOrderPage.route()),
          )
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: StyledContainer(
        child: Row(
          children: [
            Image.asset(
              'assets/shop/item.png',
              height: 100,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Bamboo Pen'),
                Text('\$50'),
              ],
            ),
            Spacer(),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Row(
                children: [
                  QuantityButton(
                    iconData: FontAwesomeIcons.minus,
                    onPressed: () => null,
                    iconSize: 8,
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '2',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  QuantityButton(
                    iconData: FontAwesomeIcons.plus,
                    onPressed: () => null,
                    iconSize: 8,
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
