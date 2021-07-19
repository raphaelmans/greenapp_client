part of 'user_bloc.dart';

enum UserStatus { unknown, loaded }

class UserState extends Equatable {
  const UserState._({required this.status, this.user = app_user.User.empty});
  final app_user.User user;
  final UserStatus status;

  const UserState.unknown() : this._(status: UserStatus.unknown);
  const UserState.loaded(app_user.User user)
      : this._(status: UserStatus.loaded, user: user);
  @override
  List<Object> get props => [];
}
