import 'package:flutter/material.dart';
import 'package:greenapp/community/community.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';
import 'package:provider/src/provider.dart';

class CommunityAbout extends StatelessWidget {
  const CommunityAbout({Key? key}) : super(key: key);

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
          (context.read<CommunityCubit>().state as CommunitySelected)
              .community
              .about,
          style: TextStyle(
            color: Color(0xff6E7191),
          ),
        ),
      )
    ]);
  }
}
