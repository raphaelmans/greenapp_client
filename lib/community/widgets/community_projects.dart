import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenapp/community/community.dart';
import 'package:greenapp/community/view/view.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';

class CommunityProjects extends StatelessWidget {
  const CommunityProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Projects',
        style: kDetailsHeadingStyle(context),
      ),
      const SizedBox(
        height: 10,
      ),
      BlocBuilder<CommunityCubit, CommunityState>(
        builder: (context, state) {
          if (state is CommunityInitial)
            return Text('failed to fetch data');
          else {
            final currState = state as CommunitySelected;
            return Column(
              children: [
                ...state.community.projects.map((proj) => GAListItem(
                    text: proj.name,
                    onPressed: () async {
                      context.read<ProjectCubit>().selectProject(proj);
                      Navigator.of(context).push<void>(CommunityEvent.route());
                    })),
              ],
            );
          }
        },
      ),
    ]);
  }
}
