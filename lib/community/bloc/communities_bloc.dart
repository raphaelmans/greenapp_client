import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:communities_repository/communities_repository.dart';
import 'package:equatable/equatable.dart';

part 'communities_event.dart';
part 'communities_state.dart';

class CommunitiesBloc extends Bloc<CommunitiesEvent, CommunitiesState> {
  final CommunitiesRepository _communitiesRepository;
  StreamSubscription? _communitiesSubscription;

  CommunitiesBloc({required CommunitiesRepository communitiesRepository})
      : _communitiesRepository = communitiesRepository,
        super(CommunitiesLoading());

  @override
  Stream<CommunitiesState> mapEventToState(
    CommunitiesEvent event,
  ) async* {
    if (event is LoadCommunities) {
      yield* _mapLoadCommunitiesToState();
    } else if (event is UpdatedCommunities) {
      yield* _mapUpdateCommunitiesToState(event);
    }
  }

  Stream<CommunitiesState> _mapLoadCommunitiesToState() async* {
    _communitiesSubscription?.cancel();
    _communitiesSubscription = _communitiesRepository.communities().listen(
          (communities) => add(UpdatedCommunities(communities)),
        );
  }

  Stream<CommunitiesState> _mapUpdateCommunitiesToState(
      UpdatedCommunities event) async* {
    yield CommunitiesLoaded(event.communities);
  }
}
