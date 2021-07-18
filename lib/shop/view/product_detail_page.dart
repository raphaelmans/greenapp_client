import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greenapp/constants.dart';
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
              onPressed: () => null,
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

class QuantityContainer extends StatelessWidget {
  const QuantityContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        QuantityButton(iconData: FontAwesomeIcons.minus, onPressed: () => null),
        SizedBox(
          width: 20,
        ),
        Text(
          '1',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        QuantityButton(iconData: FontAwesomeIcons.plus, onPressed: () => null),
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
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vitae magna nibh. Nunc dolor ligula, interdum nec pulvinar vitae, consectetur at nulla. Morbi maximus pretium diam, eget luctus enim faucibus non. Etiam vestibulum suscipit nisl vel eleifend. Maecenas varius rutrum massa',
          style: TextStyle(
            color: Color(0xff6E7191),
          ),
        ),
      )
    ]);
  }
}
