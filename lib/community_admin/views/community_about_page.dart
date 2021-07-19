import 'package:address_repository/address_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:greenapp/app/app.dart';
import 'package:greenapp/community_admin/community_admin.dart';
import 'package:greenapp/constants.dart';
import 'package:provider/src/provider.dart';

class CommunityAboutPage extends StatelessWidget {
  const CommunityAboutPage({Key? key, required this.communityAddress})
      : super(key: key);
  final Address communityAddress;

  static Route route(Address communityAddress) {
    return MaterialPageRoute<void>(
        builder: (_) => CommunityAboutPage(communityAddress: communityAddress));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommunityAboutView(communityAddress: communityAddress),
    );
  }
}

class CommunityAboutView extends StatefulWidget {
  const CommunityAboutView({Key? key, required this.communityAddress})
      : super(key: key);

  final Address communityAddress;
  @override
  State<CommunityAboutView> createState() => _CommunityAboutViewState();
}

class _CommunityAboutViewState extends State<CommunityAboutView> {
  String about = '';
  String name = '';
  Widget build(BuildContext context) {
    print(widget.communityAddress);
    return SafeArea(
      child: Padding(
        padding: kBodyPadding.copyWith(top: 45, bottom: 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,\nSet up your Community',
                style: kIntroHeadingStyle(context),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter community name',
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Tell us about your community',
                ),
                onChanged: (value) {
                  setState(() {
                    about = value;
                  });
                },
                maxLines: 5,
                minLines: 5,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: TextButton(
                  child: Text('Setup'),
                  onPressed: () async {
                    CollectionReference addressCollection =
                        FirebaseFirestore.instance.collection('address');
                    DocumentReference addressRef = await addressCollection.add({
                      'street': widget.communityAddress.street,
                      'barangay': widget.communityAddress.barangay,
                      'city': widget.communityAddress.city,
                      'province': widget.communityAddress.province,
                      'country': widget.communityAddress.country,
                      'zipCode': widget.communityAddress.zipCode,
                    });

                    CollectionReference communitiesCollection =
                        FirebaseFirestore.instance.collection('communities');

                    await communitiesCollection
                        .doc(context.read<AppBloc>().state.user.id)
                        .set({
                      'about': about,
                      'name': name,
                      'location': addressRef
                    });

                    Navigator.of(context).push(CommunityAdminPage.route());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
