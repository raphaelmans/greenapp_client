part of 'project_cubit.dart';

abstract class ProjectState extends Equatable {
  const ProjectState();

  @override
  List<Object> get props => [];
}

class ProjectInitial extends ProjectState {}

class ProjectSelected extends ProjectState {
  final Project project;

  ProjectSelected(this.project);

  @override
  List<Object> get props => [project];
}
