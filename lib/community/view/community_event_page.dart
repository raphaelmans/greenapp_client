import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenapp/community/community.dart';
import 'package:greenapp/community/view/view.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';

class CommunityEvent extends StatelessWidget {
  const CommunityEvent({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: CommunityEvent());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const CommunityEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        Text(
          (context.read<ProjectCubit>().state as ProjectSelected).project.name,
          style: kIntroHeadingStyle(context),
        ),
      ),
      body: CommunityEventView(),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}

class CommunityEventView extends StatelessWidget {
  const CommunityEventView({Key? key}) : super(key: key);

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
                  EventAbout(),
                  SizedBox(
                    height: 25,
                  ),
                  MaterialsList(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class EventAbout extends StatelessWidget {
  const EventAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'About',
        style: kDetailsHeadingStyle(context),
      ),
      const SizedBox(
        height: 10,
      ),
      StyledContainer(
        child: Text(
          (context.read<ProjectCubit>().state as ProjectSelected).project.about,
          style: TextStyle(
            color: Color(0xff6E7191),
          ),
        ),
      )
    ]);
  }
}

class MaterialsList extends StatelessWidget {
  const MaterialsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Materials Needed',
        style: kDetailsHeadingStyle(context),
      ),
      const SizedBox(
        height: 10,
      ),
      BlocBuilder<ProjectCubit, ProjectState>(
        builder: (context, state) {
          if (state is ProjectInitial) {
            return Text('failed to fetch data');
          } else {
            ProjectSelected currState = state as ProjectSelected;
            return Column(
              children: [
                ...currState.project.materials.map(
                  (material) => GAListItem(
                    text: material.name,
                    onPressed: () async {
                      await context
                          .read<MaterialCubit>()
                          .selectMaterial(material);
                      Navigator.of(context).push<void>(
                        CommunityDonationPage.route(),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    ]);
  }
}
