import 'package:address_repository/address_repository.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final bool? isCommunityAdmin;
  final String? name;
  final Address? address;

  const User(
      {required this.uid, this.isCommunityAdmin, this.name, this.address});

  static const empty = User(uid: '');

  bool get isEmpty {
    return this == User.empty;
  }

  bool get isNotEmpty => this != User.empty;

  @override
  List<Object> get props => [uid];
}
