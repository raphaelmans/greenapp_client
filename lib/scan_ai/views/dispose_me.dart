import 'package:flutter/material.dart';
import 'package:greenapp/community/community.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../scan_ai.dart';

class DisposeMe extends StatelessWidget {
  const DisposeMe({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const DisposeMe());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        Text(
          'Dispose Me',
          style: kIntroHeadingStyle(context),
        ),
        implyLeading: true,
      ),
      body: View(),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? imageLink =
        (context.read<MaterialCubit>().state as MaterialSelected)
            .material
            .imageLink;

    print(imageLink);
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,
          child: Image.network(
            imageLink ??
                'https://images.unsplash.com/photo-1536939459926-301728717817?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
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
    final material =
        (context.read<MaterialCubit>().state as MaterialSelected).material;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        material.name,
        style: kDetailsHeadingStyle(context),
      ),
      SizedBox(
        height: 10,
        width: double.infinity,
      ),
      StyledContainer(
        child: Text(material.about),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'Instructions',
        style: kDetailsHeadingStyle(context).copyWith(fontSize: 18.0),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
          'Throw in the trash or check with your city to find a drop-off location.'),
      SizedBox(
        height: 15,
      ),
      Text(
        'Disposal',
        style: kDetailsHeadingStyle(context).copyWith(fontSize: 18.0),
      ),
      SizedBox(
        height: 10,
      ),
      Text(material.disposal ??
          'Place the waste material in the proper garbage bin.'),
      SizedBox(
        height: 20,
      ),
      Center(
          child: TextButton(
              onPressed: () =>
                  Navigator.of(context).push(CommunityPage.route()),
              child: Text('Donate'))),
      SizedBox(
        height: 10,
      ),
      Center(
        child: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: TextStyle(color: Color(0xff6E7191)),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    ]);
  }
}
