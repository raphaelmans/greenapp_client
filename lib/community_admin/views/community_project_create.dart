import 'package:flutter/material.dart';
import 'package:greenapp/community_admin/views/community_project_create_materials.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/ga_list_item.dart';

class CommunityProjectCreate extends StatelessWidget {
  const CommunityProjectCreate({Key? key}) : super(key: key);

  static Page page() =>
      const MaterialPage<void>(child: CommunityProjectCreate());
  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => const CommunityProjectCreate());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: ProjectCreateView()),
    );
  }
}

class ProjectCreateView extends StatefulWidget {
  const ProjectCreateView({Key? key}) : super(key: key);

  @override
  State<ProjectCreateView> createState() => _ProjectCreateViewState();
}

class _ProjectCreateViewState extends State<ProjectCreateView> {
  String projectName = '';
  String projectAbout = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kBodyPadding.copyWith(top: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello,\nAdd a project',
            style: kIntroHeadingStyle(context),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter Project Name',
            ),
            onChanged: (value) => setState(() {
              projectName = value;
            }),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Tell us about your Project',
            ),
            minLines: 5,
            maxLines: 5,
            onChanged: (value) => setState(
              () {
                projectAbout = value;
              },
            ),
          ),
          Spacer(),
          Center(
            child: TextButton(
              child: Text('Continue'),
              onPressed: () {
                Navigator.of(context).push(
                    CommunityProjectCreateMaterials.route(
                        projectAbout: projectAbout, projectName: projectName));
              },
            ),
          )
        ],
      ),
    );
  }
}
