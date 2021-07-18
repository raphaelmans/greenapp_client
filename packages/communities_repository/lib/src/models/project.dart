import 'package:communities_repository/src/entities/project_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:waste_material_repository/waste_material_repository.dart';

class Project extends Equatable {
  final String name;
  final String about;
  final List<WasteMaterial> materials;

  Project(this.name, this.about, this.materials);

  static Project fromEntity(ProjectEntity entity) {
    return Project(entity.name, entity.about, entity.materials);
  }

  @override
  List<Object> get props => [name, about, materials];

  @override
  bool get stringify => true;
}
