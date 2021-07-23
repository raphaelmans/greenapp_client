import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communities_repository/communities_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greenapp/app/bloc/app_bloc.dart';
import 'package:greenapp/app/models/models.dart';
import 'package:greenapp/community_admin/community_admin.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/widgets/widgets.dart';
import 'package:provider/src/provider.dart';

class CommunityTransactionPage extends StatelessWidget {
  const CommunityTransactionPage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => CommunityTransactionPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        Text(
          'Transactions',
          style: kIntroHeadingStyle(context),
        ),
      ),
      body: CommunityTransactionView(),
    );
  }
}

class CommunityTransactionView extends StatefulWidget {
  const CommunityTransactionView({Key? key}) : super(key: key);

  @override
  State<CommunityTransactionView> createState() =>
      _CommunityTransactionViewState();
}

class _CommunityTransactionViewState extends State<CommunityTransactionView> {
  Future<List<Map<String, dynamic>>> getAllTransactions() async {
    final transactionsCollection =
        FirebaseFirestore.instance.collection('transactions');
    final docs = await transactionsCollection.get();
    final list = docs.docs
        .map((doc) => {...doc.data(), 'transactionId': doc.id})
        .toList();

    final transactions = list.where((e) {
      String id = e['commId'].toString();
      final commId = context.read<AppBloc>().state.user.id;
      if (id.contains(commId)) {
        return true;
      }
      return false;
    }).toList();

    return transactions;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: kBodyPadding.copyWith(top: 45),
        child: FutureBuilder(
          future: getAllTransactions(),
          builder:
              (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasData) {
              return Column(
                children: [
                  ...snapshot.data!.map((e) {
                    return UserListItem(data: e);
                  }),
                ],
              );
            }
            return Text('Failed to fetch data');
          },
        ));
  }
}

class UserListItem extends StatefulWidget {
  const UserListItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  State<UserListItem> createState() => _UserListItemState();
}

class _UserListItemState extends State<UserListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showTransactionBottomSheet(widget.data),
      child: Padding(
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
                  widget.data['email'].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.data['status'] == true ? 'Completed' : 'Pending',
                  style: TextStyle(color: Color(0xffA0A0A0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showTransactionBottomSheet(Map<String, dynamic> data) {
    handleSubmit() async {
      final docRef = FirebaseFirestore.instance
          .collection('transactions')
          .doc(data['transactionId']);

      data.remove('transactionId');

      docRef.set({...data, 'status': true});

      final userRef =
          FirebaseFirestore.instance.collection('users').doc(data['userId']);
      final userData = (await userRef.get()).data();

      userRef.set({...userData!, 'exp': userData['exp'] + 100});

      Navigator.of(context).pushReplacement(DonationConfirmationPage.route());
    }

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Padding(
            padding: kBodyPadding.copyWith(top: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      FontAwesomeIcons.user,
                      size: 72,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['email'].toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Status: ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: data['status'] == true
                                    ? 'Completed'
                                    : 'Pending',
                                style: TextStyle(
                                  color: Color(0xffED2E7E),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Event: ${data['eventName'].toString()}'),
                SizedBox(
                  height: 10,
                ),
                Text('Material Donated: ${data['materialName'].toString()}'),
                SizedBox(
                  height: 10,
                ),
                Text(
                    'Date: ${(data['date'] as Timestamp).toDate().toString().split(' ')[0]}'),
                Spacer(),
                Center(
                  child: data['status'] == false
                      ? TextButton(
                          onPressed: handleSubmit,
                          child: Text('Complete'),
                        )
                      : Text(
                          'Completed',
                          style: kIntroHeadingStyle(context),
                        ),
                ),
              ],
            ),
          ),
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
    );
  }
}
