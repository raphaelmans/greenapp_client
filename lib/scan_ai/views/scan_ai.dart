import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/scan_ai/scan_ai.dart';

class ScanAI extends StatelessWidget {
  const ScanAI({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ScanAI());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: View()),
    );
  }
}

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Color(0xff37474F),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SearchBar(),
          ),
        ),
        Spacer(),
        Container(
          color: Color(0xff37474F),
          height: 120,
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Scan your trash',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Scan the item in a bright area',
                  style: TextStyle(fontSize: 12.0, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String searchValue = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: TextField(
        decoration: InputDecoration(
            focusColor: Theme.of(context).primaryColor,
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            hintText: 'Search'),
        onChanged: (value) {
          setState(() {
            searchValue = value;
          });
        },
        onSubmitted: (value) {
          if (value.contains('bottle')) {
            Navigator.of(context).push(DisposeMe.route());
          }
        },
      ),
    );
  }
}
