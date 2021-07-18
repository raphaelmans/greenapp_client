import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenapp/community/community.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';
import '../widgets/widgets.dart';

class CommunityDetails extends StatelessWidget {
  const CommunityDetails({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: CommunityDetails());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const CommunityDetails());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityCubit, CommunityState>(
      builder: (context, state) {
        CommunitySelected currState = state as CommunitySelected;
        return Scaffold(
          appBar: HomeAppBar(
            Text(
              currState.community.name, //TODO: CHANGE TO DYNAMIC
              style: kIntroHeadingStyle(context),
            ),
          ),
          body: CommunityDetailsView(),
          bottomNavigationBar: HomeBottomNavBar(),
        );
      },
    );
  }
}

class CommunityDetailsView extends StatelessWidget {
  const CommunityDetailsView({Key? key}) : super(key: key);

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
                  CommunityAbout(),
                  SizedBox(
                    height: 25,
                  ),
                  CommunityProjects(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
