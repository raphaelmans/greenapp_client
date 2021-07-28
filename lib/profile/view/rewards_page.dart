import 'package:flutter/material.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/shop/widgets/widgets.dart';
import 'package:greenapp/widgets/widgets.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const RewardsPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: HomeAppBar(
        Text(
          'Rewards',
          style: kIntroHeadingStyle(context),
        ),
        implyLeading: true,
      ),
      body: ShopView(),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kBodyPadding.copyWith(top: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: ShopLayout()),
        ],
      ),
    );
  }
}

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mockData = [
      Shopitem(itemName: 'Bamboo Pen', greenPoints: 50),
    ];
    return GridView.builder(
        scrollDirection: Axis.vertical,
        clipBehavior: Clip.none,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 25.0,
          childAspectRatio: 9 / 16,
          crossAxisSpacing: 25.0,
        ),
        itemCount: mockData.length,
        itemBuilder: (context, index) {
          return ShopCard(
            onPressed: () => null,
            child: Content(
              shopItem: mockData[index],
            ),
          );
        });
  }
}

class Shopitem {
  Shopitem({required this.itemName, required this.greenPoints});
  final String itemName;
  final double greenPoints;
}

class Content extends StatelessWidget {
  const Content({
    Key? key,
    required this.shopItem,
  }) : super(key: key);

  final Shopitem shopItem;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/shop/item.png',
            fit: BoxFit.cover,
          ),
          Text(
            shopItem.itemName,
          ),
          Text(
            '${shopItem.greenPoints.toInt().toString()} GP',
            style: kPriceTextStyle,
          )
        ],
      ),
    );
  }
}
