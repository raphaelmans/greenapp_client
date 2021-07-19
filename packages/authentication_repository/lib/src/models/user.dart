import 'package:address_repository/address_repository.dart';
import 'package:equatable/equatable.dart';

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
class User extends Equatable {
  /// {@macro user}
  const User(
      {required this.id,
      this.email,
      this.name,
      this.address,
      this.isCommunityAdmin});

  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  final bool? isCommunityAdmin;

  final Address? address;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [
        email,
        id,
        name,
      ];

  User copyWith({
    String? email,
    String? name,
    bool? isCommunityAdmin,
    Address? address,
  }) {
    return User(
      email: email ?? this.email,
      id: id,
      name: name ?? this.name,
      isCommunityAdmin: isCommunityAdmin ?? this.isCommunityAdmin,
      address: address ?? this.address,
    );
  }
}
