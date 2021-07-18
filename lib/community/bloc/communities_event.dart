part of 'communities_bloc.dart';

abstract class CommunitiesEvent extends Equatable {
  const CommunitiesEvent();

  @override
  List<Object> get props => [];
}

class LoadCommunities extends CommunitiesEvent {}

class UpdatedCommunities extends CommunitiesEvent {
  final List<Community> communities;

  const UpdatedCommunities(this.communities);

  @override
  List<Object> get props => [communities];
}
