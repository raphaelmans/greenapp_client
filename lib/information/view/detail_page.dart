import 'package:flutter/material.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: DetailPage());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const DetailPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        Text(
          'Information',
          style: kIntroHeadingStyle(context),
        ),
      ),
      body: DetailView(),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageLink =
        'https://images.unsplash.com/photo-1536939459926-301728717817?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80https://images.unsplash.com/photo-1536939459926-301728717817?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';

    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,
          child: Image.network(
            imageLink,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: kBodyPadding.copyWith(top: 20, bottom: 0),
          child: Content(),
        )
      ]),
    );
  }
}

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PET',
          style: kDetailsHeadingStyle(context),
        ),
        SizedBox(
          height: 10,
          width: double.infinity,
        ),
        StyledContainer(
          child: Text(
              'Polyethylene Terephthalate (also abbreviated PETE) is a transparent, sturdy, and lightweight plastic often used in the packaging of foods and beverages, particularly convenience-sized soft drinks, juices, and water. Products made of this plastic should be recycled but not reused.'),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Code',
          style: kDetailsHeadingStyle(context).copyWith(fontSize: 18.0),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
            'PET can easily be identified by the #1 in the triangular "chasing arrows" code, which is usually found molded into the bottom or side of the container. No other plastic carries the #1 code.'),
        SizedBox(
          height: 15,
        ),
        Text(
          'Fully Recyclable ',
          style: kDetailsHeadingStyle(context).copyWith(fontSize: 18.0),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
            'PET is completely recyclable, and is the most recycled plastic in the U.S and worldwide. More than 1.5 billion pounds of used PET bottles and containers are recovered in the United States each year for recycling. '),
      ],
    );
  }
}
