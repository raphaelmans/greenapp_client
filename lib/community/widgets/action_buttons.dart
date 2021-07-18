import 'package:communities_repository/communities_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenapp/community/community.dart';
import 'package:greenapp/widgets/widgets.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunitiesBloc, CommunitiesState>(
      builder: (context, state) {
        if (state is CommunitiesLoaded) {
          return GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 25.0,
            crossAxisSpacing: 25.0,
            scrollDirection: Axis.vertical,
            clipBehavior: Clip.none,
            children: [
              ...state.communities.map(
                (comm) => AppCard(
                  onPressed: () async {
                    await context.read<CommunityCubit>().selectCommunity(comm);
                    Navigator.of(context).push<void>(CommunityDetails.route());
                  },
                  child: Content(
                    community: comm,
                  ),
                ),
              ),
            ],
          );
        } else {
          return Text('Failed to fetch communities');
        }
      },
    );
  }
}

class Content extends StatelessWidget {
  const Content({Key? key, required this.community}) : super(key: key);

  final Community community;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/community/community_placeholder.png'),
        Text(
          community.name,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
