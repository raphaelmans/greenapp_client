import 'package:address_repository/address_repository.dart';
import 'package:flutter/material.dart';
import 'package:greenapp/community_admin/community_admin.dart';

class CommunityForm extends StatefulWidget {
  const CommunityForm({
    Key? key,
  }) : super(key: key);

  @override
  State<CommunityForm> createState() => _CommunityFormState();
}

class _CommunityFormState extends State<CommunityForm> {
  String street = '';
  String barangay = '';
  String city = '';
  String province = '';
  String country = '';
  String zipCode = '';

  handleChange(value, name) {
    switch (name) {
      case 'street':
        setState(() {
          street = value;
        });
        break;
      case 'barangay':
        setState(() {
          barangay = value;
        });
        break;
      case 'city':
        setState(() {
          city = value;
        });
        break;
      case 'province':
        setState(() {
          province = value;
        });
        break;
      case 'country':
        setState(() {
          country = value;
        });
        break;
      case 'zipCode':
        setState(() {
          zipCode = value;
        });
        break;
      default:
        {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Enter Street',
          ),
          onChanged: (value) => handleChange(value, 'street'),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Enter Barangay',
          ),
          onChanged: (value) => handleChange(value, 'barangay'),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Enter City',
          ),
          onChanged: (value) => handleChange(value, 'city'),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Enter Province',
          ),
          onChanged: (value) => handleChange(value, 'province'),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Enter Country',
          ),
          onChanged: (value) => handleChange(value, 'country'),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Enter Zip Code',
          ),
          onChanged: (value) => handleChange(value, 'zipCode'),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: TextButton(
            child: Text('Next'),
            onPressed: () {
              Address address =
                  Address(street, barangay, city, province, country, zipCode);

              Navigator.of(context).push(CommunityAboutPage.route(address));
            },
          ),
        ),
      ],
    );
  }
}
