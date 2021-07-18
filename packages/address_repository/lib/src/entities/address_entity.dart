import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class AddressEntity extends Equatable {
  final String street;
  final String barangay;
  final String city;
  final String province;
  final String country;
  final String zipCode;

  AddressEntity(
    this.street,
    this.barangay,
    this.city,
    this.province,
    this.country,
    this.zipCode,
  );

  @override
  List<Object> get props {
    return [
      street,
      barangay,
      city,
      province,
      country,
      zipCode,
    ];
  }

  Map<String, dynamic> toDocument() {
    return {
      'street': street,
      'barangay': barangay,
      'city': city,
      'province': province,
      'country': country,
      'zipCode': zipCode,
    };
  }

  factory AddressEntity.fromJson(Map<String, dynamic> json) {
    return AddressEntity(
      json['street'] as String,
      json['barangay'] as String,
      json['city'] as String,
      json['province'] as String,
      json['country'] as String,
      json['zipCode'] as String,
    );
  }

  factory AddressEntity.fromSnapshot(DocumentSnapshot snap) {
    final Map<String, dynamic> snapData = snap.data() as Map<String, dynamic>;
    return AddressEntity(
      snapData['street'],
      snapData['barangay'],
      snapData['city'],
      snapData['province'],
      snapData['country'],
      snapData['zipCode'],
    );
  }
}
