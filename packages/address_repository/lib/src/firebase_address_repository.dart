import 'package:address_repository/address_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'entities/entities.dart';

class FirebaseAddressRepository implements AddressRepository {
  final addressCollection = FirebaseFirestore.instance.collection('address');

  @override
  Future<void> addNewAddress(Address address) {
    return addressCollection.add(address.toEntity().toDocument());
  }

  @override
  Future<void> updateAddress(Address address) {
    // TODO: implement updateAddress
    throw UnimplementedError();
  }
}
