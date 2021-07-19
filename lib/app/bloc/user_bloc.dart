import 'dart:async';

import 'package:address_repository/address_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart' as app_user;

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const UserState.unknown()) {
    _userSubscription = _authenticationRepository.user.listen(_onUserChanged);
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;
  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      yield _mapUserChangedToState(event, state);
    }
  }

  _onUserChanged(User user) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    if (user.isNotEmpty) {
      DocumentSnapshot snap = await users.doc(user.id.toString()).get();
      final Map<String, dynamic> snapData = snap.data() as Map<String, dynamic>;
      bool isAdmin = snapData['isCommunityAdmin'] ?? false;
      String name = snapData['name'] ?? user.email;
      Address? address = snapData['address'] != null
          ? Address.fromEntity(
              AddressEntity.fromSnapshot(await snapData['address'].get()))
          : null;
      app_user.User currUser = app_user.User(
          uid: user.id.toString(),
          name: name,
          address: address,
          isCommunityAdmin: isAdmin);
      add(LoadUser(currUser));
    }
  }

  UserState _mapUserChangedToState(LoadUser event, UserState state) {
    return event.user.isNotEmpty
        ? UserState.loaded(event.user)
        : const UserState.unknown();
  }
}
