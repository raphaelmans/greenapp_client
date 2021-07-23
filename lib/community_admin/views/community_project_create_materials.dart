import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communities_repository/communities_repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greenapp/app/bloc/app_bloc.dart';
import 'package:greenapp/community_admin/views/community_admin_router.dart';
import 'package:greenapp/constants.dart';
import 'package:provider/src/provider.dart';
import 'package:waste_material_repository/waste_material_repository.dart';

class CommunityProjectCreateMaterials extends StatefulWidget {
  CommunityProjectCreateMaterials(
      {Key? key, required this.projectName, required this.projectAbout})
      : super(key: key);

  final String projectName;
  final String projectAbout;

  static Route route(
      {required String projectName, required String projectAbout}) {
    return MaterialPageRoute<void>(
      builder: (_) => CommunityProjectCreateMaterials(
        projectAbout: projectAbout,
        projectName: projectName,
      ),
    );
  }

  @override
  _CommunityProjectCreateMaterialsState createState() =>
      _CommunityProjectCreateMaterialsState();
}

class _CommunityProjectCreateMaterialsState
    extends State<CommunityProjectCreateMaterials> {
  List<String> projectMaterials = [];
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
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
              controller: controller,
              decoration: InputDecoration(hintText: 'Enter Materials'),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 100,
                child: TextButton(
                  onPressed: () => {
                    setState(() {
                      projectMaterials.add(controller.text);
                      controller.text = '';
                    })
                  },
                  child: const Text('Add'),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Wrap(
              children: [
                ...projectMaterials.map(
                  (material) => GestureDetector(
                    onTap: () {
                      setState(() {
                        projectMaterials.remove(material);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffEFF0F6),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 18.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(material),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(FontAwesomeIcons.times, size: 12.0)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Center(
              child: TextButton(
                onPressed: () async {
                  final materialSnapshots = await FirebaseFirestore.instance
                      .collection('materials')
                      .get();

                  final docs = materialSnapshots.docs;
                  final list = docs.map((e) {
                    return {...e.data(), 'ref': e.reference};
                  }).toList();
                  List wasteMaterials = [];
                  projectMaterials.map((materialElem) {
                    for (var element in list) {
                      if (element.containsValue(materialElem)) {
                        wasteMaterials.add(element['ref']);
                      }
                    }
                  }).toList();
                  if (wasteMaterials.isNotEmpty) {
                    final project = {
                      'name': widget.projectName,
                      'about': widget.projectAbout,
                      'materials': [...wasteMaterials]
                    };
                    final projectResult = await FirebaseFirestore.instance
                        .collection('projects')
                        .add(project);

                    final communityId = context.read<AppBloc>().state.user.id;

                    final communityCollection =
                        FirebaseFirestore.instance.collection('communities');
                    final community =
                        await communityCollection.doc(communityId).get();

                    await communityCollection.doc(communityId.toString()).set({
                      ...?community.data(),
                      'projects': [...?community['projects'], projectResult]
                    });

                    Navigator.of(context)
                        .pushReplacement(CommunityAdminRouter.route());
                  }
                },
                child: Text('Finish'),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
