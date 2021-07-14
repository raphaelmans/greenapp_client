import 'package:flutter/material.dart';
import 'package:greenapp/widgets/widgets.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 25.0,
      crossAxisSpacing: 25.0,
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.none,
      children: [
        AppCard(
          child: Content(
            label: 'Palawan SK',
          ),
        ),
        AppCard(
          child: Content(
            label: 'CIT-U',
          ),
        ),
      ],
    );
  }
}

class Content extends StatelessWidget {
  const Content({Key? key, this.label}) : super(key: key);

  final String? label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/community/community_placeholder.png'),
        Text(
          label ?? '',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
