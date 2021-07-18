part of 'communities_bloc.dart';

abstract class CommunitiesState extends Equatable {
  const CommunitiesState();

  @override
  List<Object> get props => [];
}

class CommunitiesLoading extends CommunitiesState {}

class CommunitiesLoaded extends CommunitiesState {
  final List<Community> communities;

  const CommunitiesLoaded([this.communities = const []]);

  @override
  List<Object> get props => [communities];

  @override
  String toString() => 'CommunitiesLoaded { communities: $communities }';
}

class CommunitiesNotLoaded extends CommunitiesState {}
