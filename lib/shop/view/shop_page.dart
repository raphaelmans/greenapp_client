import 'package:flutter/material.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';
import '../widgets/widgets.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: ShopPage());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ShopPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: HomeAppBar(
        Text(
          'Shop',
          style: kIntroHeadingStyle(context),
        ),
      ),
      body: const HomeBG(
        child: ShopView(),
      ),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getPageTextLabel('What do you want to buy\ntoday?'),
        Expanded(child: ShopLayout()),
      ],
    );
  }
}