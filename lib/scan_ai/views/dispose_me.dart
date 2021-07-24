import 'package:flutter/material.dart';
import 'package:greenapp/community/community.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';

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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Plastic Bottle',
        style: kDetailsHeadingStyle(context),
      ),
      SizedBox(
        height: 10,
        width: double.infinity,
      ),
      StyledContainer(
        child: Text(
            'Plastic bottles are the most commonly-recycled household plastics. Plastic bottles require up to 700 years to dissolve. 80% of plastic bottles never get recycled and 24,000,000 liters of oil is needed to produce these billions of plastic bottles.'),
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
      Text(
          'Put the plastic bottle inside the non-biodegradble portion of your garbage bin.'),
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
