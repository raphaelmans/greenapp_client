part of 'community_cubit.dart';

abstract class CommunityState extends Equatable {
  const CommunityState();

  @override
  List<Object> get props => [];
}

class CommunityInitial extends CommunityState {}

class CommunitySelected extends CommunityState {
  final Community community;

  const CommunitySelected(this.community);

  @override
  List<Object> get props => [community];
}
