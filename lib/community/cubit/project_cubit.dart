import 'package:bloc/bloc.dart';
import 'package:communities_repository/communities_repository.dart';
import 'package:equatable/equatable.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit() : super(ProjectInitial());

  selectProject(Project project) {
    emit(ProjectSelected(project));
  }
}
