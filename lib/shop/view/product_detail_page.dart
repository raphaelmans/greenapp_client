import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/shop/shop.dart';
import 'package:greenapp/shop/widgets/widgets.dart';
import 'package:greenapp/widgets/widgets.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: ProductDetailPage());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ProductDetailPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        Text(
          'Shop',
          style: kIntroHeadingStyle(context),
        ),
      ),
      body: ProductDetailView(),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kBodyPadding.copyWith(bottom: 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ProductItem(),
            SizedBox(
              height: 15,
            ),
            QuantityContainer(),
            SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Center(
                      child: Text(
                    'Added To Cart',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColorDark),
                  )),
                  actions: <Widget>[
                    Column(
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.of(context).push(CartPage.route()),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.grey),
                          child: const Text('Go To Cart'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              child: Text('Add to Cart'),
            ),
            SizedBox(
              height: 20,
            ),
            ProductAbout(),
          ],
        ),
      ),
    );
  }
}

class QuantityContainer extends StatefulWidget {
  const QuantityContainer({Key? key}) : super(key: key);

  @override
  State<QuantityContainer> createState() => _QuantityContainerState();
}

class _QuantityContainerState extends State<QuantityContainer> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        QuantityButton(
            iconData: FontAwesomeIcons.minus,
            onPressed: () => setState(() {
                  if (qty > 1) {
                    qty--;
                  }
                })),
        SizedBox(
          width: 20,
        ),
        Text(
          '${qty.toString()}',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        QuantityButton(
            iconData: FontAwesomeIcons.plus,
            onPressed: () => setState(() {
                  qty++;
                })),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Bamboo Pen',
              style: kDetailsHeadingStyle(context),
            ),
            Text(
              '\$50',
              style: kPriceTextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        AppCard(
          height: 240,
          width: double.infinity,
          child: Image.asset(
            'assets/shop/item.png',
            fit: BoxFit.contain,
          ),
        )
      ],
    );
  }
}

class ProductAbout extends StatelessWidget {
  const ProductAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'About',
        style: kDetailsHeadingStyle(context),
      ),
      const SizedBox(
        height: 10,
      ),
      StyledContainer(
        child: const Text(
          "This isn't your average office supply; this high-quality pen is handcrafted from bamboo, a unique crop that is both sustainable and adaptable. Reed bamboo and coconut shelves are used to make these pens. Bamboo is environmentally beneficial and helps to save streams.",
          style: TextStyle(
            color: Color(0xff6E7191),
          ),
        ),
      )
    ]);
  }
}
