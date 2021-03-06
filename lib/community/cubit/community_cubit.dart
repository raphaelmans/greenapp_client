import 'package:bloc/bloc.dart';
import 'package:communities_repository/communities_repository.dart';
import 'package:equatable/equatable.dart';

part 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  CommunityCubit() : super(CommunityInitial());

  selectCommunity(Community community) {
    emit(CommunitySelected(community));
  }
}
