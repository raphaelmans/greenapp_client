import 'package:address_repository/address_repository.dart';
import 'package:communities_repository/communities_repository.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart';

class Community extends Equatable {
  final String about;
  final Address location;
  final List<Project> projects;
  final String name;

  Community(this.about, this.location, this.projects, this.name);

  static Community fromEntity(CommunityEntity entity) {
    return Community(
        entity.about, entity.location, entity.projects, entity.name);
  }

  @override
  List<Object> get props => [about, location, projects, name];
}
