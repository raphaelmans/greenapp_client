import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/information/view/detail_page.dart';
import 'package:greenapp/information/view/recycle_detail_page.dart';
import 'package:greenapp/widgets/widgets.dart';

class InfromationDetailPage extends StatelessWidget {
  const InfromationDetailPage({Key? key}) : super(key: key);

  static Page page() =>
      const MaterialPage<void>(child: InfromationDetailPage());
  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => const InfromationDetailPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        Text(
          'Plastic',
          style: kIntroHeadingStyle(context),
        ),
      ),
      body: InformationDetailView(),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}

class InformationDetailView extends StatelessWidget {
  const InformationDetailView({Key? key}) : super(key: key);

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
          child: PlasticContent(),
        )
      ]),
    );
  }
}

class PlasticContent extends StatelessWidget {
  const PlasticContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CategoryContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(FontAwesomeIcons.recycle),
                  Text('PET'),
                ],
              ),
            ),
            CategoryContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(FontAwesomeIcons.recycle),
                  Text('HDPE'),
                ],
              ),
            ),
            CategoryContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(FontAwesomeIcons.recycle),
                  Text('LDPE'),
                ],
              ),
            ),
            CategoryContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(FontAwesomeIcons.recycle),
                  Text('PP'),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        GAListItem(
          onPressed: () =>
              Navigator.of(context).push(RecycleDetailPage.route()),
          text: 'Plastic beverage bottles, cups, etc.',
        ),
        GAListItem(
          onPressed: () => null,
          text: 'Plastic bags, strech folio.',
        ),
        GAListItem(
          onPressed: () => null,
          text: 'Opaque Containers',
        ),
        GAListItem(
          onPressed: () => null,
          text: 'Plastic Containers.',
        ),
        GAListItem(
          onPressed: () => null,
          text: 'Plastic Straws.',
        ),
      ],
    );
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(DetailPage.route()),
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffDBDBDB),
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(child: child),
        ),
      ),
    );
  }
}
