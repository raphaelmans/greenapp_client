import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:greenapp/navigation/navigation.dart';
import 'package:very_good_analysis/very_good_analysis.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(
      {required AuthenticationRepository authenticationRepository,
      required NavCubit navCubit})
      : _authenticationRepository = authenticationRepository,
        _navCubit = navCubit,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AppState.authenticated(authenticationRepository.currentUser)
              : const AppState.unauthenticated(),
        ) {
    _userSubscription = _authenticationRepository.user.listen(_onUserChanged);
    _navScreenSubscription = navCubit.stream.listen(_onScreenChanged);
  }

  final AuthenticationRepository _authenticationRepository;
  final NavCubit _navCubit;
  late final StreamSubscription<User> _userSubscription;
  late final StreamSubscription<NavScreen> _navScreenSubscription;

  void _onUserChanged(User user) async {
    add(AppUserChanged(user));
  }

  void _onScreenChanged(NavScreen screen) => add(AppChangeScreen(screen));

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is AppUserChanged) {
      yield _mapUserChangedToState(event, state);
    } else if (event is AppLogoutRequested) {
      unawaited(_authenticationRepository.logOut());
    } else if (event is AppChangeScreen) {
      yield _mapAppScreenChangedToState(event, state);
    }
  }

  AppState _mapAppScreenChangedToState(AppChangeScreen event, AppState state) {
    return AppState.changeScreen(state.user, event.screen);
  }

  AppState _mapUserChangedToState(AppUserChanged event, AppState state) {
    return event.user.isNotEmpty
        ? AppState.authenticated(event.user)
        : const AppState.unauthenticated();
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
