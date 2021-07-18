import 'package:address_repository/address_repository.dart';

abstract class AddressRepository {
  Future<void> addNewAddress(Address address);

  // Future<void> deleteAddress(Address address);

  // Stream<List<Address>> addresses();

  Future<void> updateAddress(Address address);
}
