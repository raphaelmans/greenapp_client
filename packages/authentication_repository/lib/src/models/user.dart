import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({required this.id, this.email, this.name, this.token});

  final String id;
  final String? email;
  final String? name;
  final String? token;

  static const empty = User(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;
  @override
  List<Object?> get props => [email, name];
}
