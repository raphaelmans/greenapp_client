import 'package:flutter/material.dart';
import 'package:greenapp/community/cubit/cubit.dart';
import 'package:greenapp/community/widgets/widgets.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';
import 'package:provider/src/provider.dart';

class CommunityDonationPage extends StatelessWidget {
  const CommunityDonationPage({Key? key}) : super(key: key);

  static Page page() =>
      const MaterialPage<void>(child: CommunityDonationPage());
  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => const CommunityDonationPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        Text(
          'Donate', //TODO: CHANGE TO DYNAMIC
          style: kIntroHeadingStyle(context),
        ),
      ),
      body: CommunityDonationView(),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}

class CommunityDonationView extends StatelessWidget {
  const CommunityDonationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageLink =
        'https://images.unsplash.com/photo-1536939459926-301728717817?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80https://images.unsplash.com/photo-1536939459926-301728717817?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,
          child: Image.network(
            imageLink,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: kBodyPadding.copyWith(top: 20.0),
              child: Column(
                children: [
                  MaterialAbout(),
                  SizedBox(
                    height: 25,
                  ),
                  CommunityLocation(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class MaterialAbout extends StatelessWidget {
  const MaterialAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        (context.read<MaterialCubit>().state as MaterialSelected).material.name,
        style: kDetailsHeadingStyle(context),
      ),
      const SizedBox(
        height: 10,
      ),
      StyledContainer(
        child: Text(
          (context.read<MaterialCubit>().state as MaterialSelected)
              .material
              .about,
          style: TextStyle(
            color: Color(0xff6E7191),
          ),
        ),
      )
    ]);
  }
}

class CommunityLocation extends StatelessWidget {
  const CommunityLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: kDetailsHeadingStyle(context),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          (context.read<CommunityCubit>().state as CommunitySelected)
              .community
              .location
              .toString(),
          style: TextStyle(
            color: Color(0xff6E7191),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () => null,
            child: Text('Drop-off'),
          ),
        )
      ],
    );
  }
}
