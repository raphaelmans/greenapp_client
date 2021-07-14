import 'package:flutter/material.dart';
import 'package:greenapp/widgets/widgets.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 25.0,
          crossAxisSpacing: 25.0,
          scrollDirection: Axis.vertical,
          clipBehavior: Clip.none,
          children: [
            AppCard(
              child: Image.asset('assets/home/plastic.png'),
            ),
            AppCard(
              child: Image.asset('assets/home/metal.png'),
            ),
            AppCard(
              child: Image.asset('assets/home/glass.png'),
            ),
            AppCard(
              child: Image.asset('assets/home/ewaste.png'),
            ),
            AppCard(
              child: Image.asset('assets/home/organic.png'),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [...children],
    );
  }
}
