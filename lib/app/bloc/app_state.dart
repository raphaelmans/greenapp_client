part of 'app_bloc.dart';

enum AppStatus { authenticated, unauthenticated, unknown }

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.screen = NavScreen.intro,
    this.user = User.empty,
  });

  const AppState.authenticated(User user)
      : this._(
            status: AppStatus.authenticated,
            user: user,
            screen: NavScreen.home);

  const AppState.changeScreen(User user, NavScreen screen)
      : this._(status: AppStatus.authenticated, user: user, screen: screen);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  final AppStatus status;
  final NavScreen screen;
  final User user;

  @override
  List<Object> get props => [status, user, screen];
}
