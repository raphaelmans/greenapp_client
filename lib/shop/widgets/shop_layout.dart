import 'package:flutter/material.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/shop/view/product_detail_page.dart';
import 'widgets.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mockData = [
      Shopitem(itemName: 'Bamboo Pen', itemPrice: 50.0),
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
            onPressed: () =>
                Navigator.of(context).push<void>(ProductDetailPage.route()),
            child: Content(
              shopItem: mockData[index],
            ),
          );
        });
  }
}

class Shopitem {
  Shopitem({required this.itemName, required this.itemPrice});
  final String itemName;
  final double itemPrice;
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
            '\$${shopItem.itemPrice.toString()}',
            style: kPriceTextStyle,
          )
        ],
      ),
    );
  }
}
