import 'package:flutter/material.dart';
import 'package:greenapp/community/community.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';

class RecycleIt extends StatelessWidget {
  const RecycleIt({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const RecycleIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        Text(
          'Plastic Bottles',
          style: kIntroHeadingStyle(context),
        ),
        implyLeading: true,
      ),
      body: RecycleDetailView(),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}

class RecycleDetailView extends StatelessWidget {
  const RecycleDetailView({Key? key}) : super(key: key);

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
          padding: kBodyPadding.copyWith(top: 20, bottom: 20),
          child: const Content(),
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
          'Yes, recycle',
          style: kDetailsHeadingStyle(context),
        ),
        SizedBox(
          height: 10,
          width: double.infinity,
        ),
        Text('Place this item in your recycling bin.'),
        SizedBox(
          height: 15,
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
          'Repurpose',
          style: kDetailsHeadingStyle(context).copyWith(fontSize: 18.0),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
            'Here are different ways you can reuse your everyday plastic bottles.'),
        SizedBox(
          height: 10,
        ),
        RecycleList(),
        SizedBox(
          height: 20,
        ),
        Center(
            child: TextButton(
                onPressed: () =>
                    Navigator.of(context).push(CommunityPage.route()),
                child: Text('Donate'))),
      ],
    );
  }
}

class RecycleList extends StatefulWidget {
  const RecycleList({Key? key}) : super(key: key);

  @override
  State<RecycleList> createState() => _RecycleListState();
}

class _RecycleListState extends State<RecycleList> {
  List<bool> _isOpen = [false];
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      children: [
        ExpansionPanel(
          headerBuilder: (context, isOpen) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Recycled Bird Feeder')),
            );
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, height: 1.5),
                    children: [
                      TextSpan(
                          text: 'Stuff you need\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '• Plastic Drinks Bottles\n'),
                      TextSpan(text: '• Yoghurt Pots or Milk Cartons\n'),
                      TextSpan(text: '• Wire or String\n'),
                      TextSpan(text: '• Beed Seed\n'),
                      TextSpan(text: '• Scissors\n'),
                      TextSpan(
                          text: 'Instructions\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              '• Cut a hole in the side large enough to allow a free flow of seeds, but in such a way that it won’t all fall out on the ground in the slightest puff of wind, and won’t get wet if it rains.\n'),
                      TextSpan(
                          text:
                              '• Make a few small holes in the bottom of your feeder to allow any rainwater to drain away.\n'),
                      TextSpan(
                          text:
                              '• Hang it with wire, or even strong string from a tree or your washing line.\n'),
                      TextSpan(
                          text:
                              '• If your feeder starts to wear out or the food in it goes mouldy, recycle it and make another one! Remember to keep your feeders well stocked, especially in winter. Birds come to rely on them and will go hungry if you forget\n'),
                    ],
                  ),
                )
              ],
            ),
          ),
          isExpanded: _isOpen[0],
        ),
      ],
      expansionCallback: (i, isOpen) => setState(() {
        _isOpen[i] = !isOpen;
      }),
    );
  }
}
