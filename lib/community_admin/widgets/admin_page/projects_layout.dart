import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communities_repository/communities_repository.dart';
import 'package:flutter/material.dart';
import 'package:greenapp/app/app.dart';
import 'package:greenapp/community/cubit/cubit.dart';
import 'package:greenapp/community_admin/views/community_admin_project_details.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/app_card.dart';
import 'package:provider/src/provider.dart';

class ProjectLayout extends StatelessWidget {
  const ProjectLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Project>> getCommunityProjects() async {
      final communityId = context.read<AppBloc>().state.user.id;
      final communitySnap =
          FirebaseFirestore.instance.collection('communities').doc(communityId);
      final communitySnapshot = await communitySnap.get();
      final community = Community.fromEntity(
          await CommunityEntity.fromSnapshot(communitySnapshot));
      return community.projects;
    }

    return SingleChildScrollView(
      child: FutureBuilder(
          future: getCommunityProjects(),
          builder: (context, AsyncSnapshot<List<Project>> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  ...snapshot.data!.map(
                    (project) => AppCard(
                      onPressed: () async {
                        await context
                            .read<ProjectCubit>()
                            .selectProject(project);
                        Navigator.of(context)
                            .push(CommunityAdminProjectDetails.route());
                      },
                      width: double.infinity,
                      child: CardContent(
                        project: project,
                      ),
                    ),
                  )
                ],
              );
            }
            return Text('test');
          }),
    );
  }
}

class CardContent extends StatelessWidget {
  const CardContent({Key? key, required this.project}) : super(key: key);
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/home/plastic.png'),
        Text(
          project.name,
          style: kIntroHeadingStyle(context),
        ),
      ],
    );
  }
}