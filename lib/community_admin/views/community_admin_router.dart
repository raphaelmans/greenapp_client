import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:greenapp/app/app.dart';
import 'package:greenapp/community_admin/community_admin.dart';
import 'package:provider/src/provider.dart';

class CommunityAdminRouter extends StatefulWidget {
  const CommunityAdminRouter({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: CommunityAdminRouter());
  @override
  State<CommunityAdminRouter> createState() => _CommunityAdminRouterState();
}

class _CommunityAdminRouterState extends State<CommunityAdminRouter> {
  @override
  void initState() {
    super.initState();
    _navigateTo();
  }

  _navigateTo() async {
    final communities = FirebaseFirestore.instance.collection('communities');
    final snapshot = await communities
        .doc(context.read<AppBloc>().state.user.id.toString())
        .get();
    if (snapshot.exists) {
      Navigator.of(context).push(CommunityAdminPage.route());
    } else {
      Navigator.of(context).push(CommunitySetupPage.route());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Please wait'),
            SizedBox(height: 10),
            CircularProgressIndicator()
          ]),
        ),
      ),
    );
  }
}
