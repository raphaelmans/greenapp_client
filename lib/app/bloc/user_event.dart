part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {
  const LoadUser(this.user);

  final app_user.User user;
  @override
  List<Object> get props => [user];
}
