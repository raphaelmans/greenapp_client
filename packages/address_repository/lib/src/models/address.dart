import 'package:address_repository/src/entities/entities.dart';
import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String street;
  final String barangay;
  final String city;
  final String province;
  final String country;
  final String zipCode;

  Address(
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

  AddressEntity toEntity() {
    return AddressEntity(street, barangay, city, province, country, zipCode);
  }

  static Address fromEntity(AddressEntity entity) {
    return Address(
      entity.street,
      entity.barangay,
      entity.city,
      entity.province,
      entity.country,
      entity.zipCode,
    );
  }

  @override
  String toString() {
    return '$street, $barangay, $city, $province, $country, $zipCode';
  }
}
