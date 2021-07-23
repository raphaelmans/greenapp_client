import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communities_repository/communities_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenapp/app/bloc/app_bloc.dart';
import 'package:greenapp/community/cubit/cubit.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';
import 'package:provider/src/provider.dart';
import 'package:waste_material_repository/waste_material_repository.dart';

class CommunityAdminProjectDetails extends StatelessWidget {
  const CommunityAdminProjectDetails({Key? key}) : super(key: key);

  static Page page() =>
      const MaterialPage<void>(child: CommunityAdminProjectDetails());
  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => const CommunityAdminProjectDetails());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        Text(
          (context.read<ProjectCubit>().state as ProjectSelected).project.name,
          style: kIntroHeadingStyle(context),
        ),
        implyLeading: true,
      ),
      body: CommunityEventView(),
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
                  SizedBox(
                    height: 25,
                  ),
                  LocationDropOff(),
                ],
              ),
            ),
          ),
        ),
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
          // (context.read<ProjectCubit>().state as ProjectSelected).project.about,
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
        'Materials Donated',
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
                  (material) => MaterialDonated(
                    material: material,
                    projectName: currState.project.name,
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

class MaterialDonated extends StatelessWidget {
  const MaterialDonated(
      {Key? key, required this.material, required this.projectName})
      : super(key: key);

  final WasteMaterial material;
  final String projectName;
  @override
  Widget build(BuildContext context) {
    getMaterialCount() async {
      final docRef = await FirebaseFirestore.instance
          .collection('transactions')
          .where('eventName', isEqualTo: projectName)
          .where('status', isEqualTo: true)
          .get();
      return docRef.size;
    }

    getMaterialCount();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffDBDBDB),
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                material.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              FutureBuilder(
                  future: getMaterialCount(),
                  builder: (context, snapshot) {
                    String text = '...fetching';
                    if (snapshot.hasData) {
                      text = snapshot.data.toString();
                    } else if (snapshot.hasError) {
                      text = '0';
                    }
                    return Text(
                      text,
                      style: TextStyle(
                          color: Color(0xffA0A0A0),
                          fontWeight: FontWeight.bold),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class LocationDropOff extends StatelessWidget {
  const LocationDropOff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<Community> getLocationDropOff() async {
      final communityId = context.read<AppBloc>().state.user.id;
      final communityCollection =
          FirebaseFirestore.instance.collection('communities');
      final communitySnapshot =
          await communityCollection.doc(communityId).get();

      final community = Community.fromEntity(
          await CommunityEntity.fromSnapshot(communitySnapshot));

      return community;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location Drop Off',
          style: kDetailsHeadingStyle(context),
        ),
        SizedBox(
          height: 10,
        ),
        FutureBuilder(
            future: getLocationDropOff(),
            builder: (context, AsyncSnapshot<Community> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.location.toString());
              }
              return Text('Fetching Data');
            }),
      ],
    );
  }
}
