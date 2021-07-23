import 'package:address_repository/address_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communities_repository/src/entities/project_entity.dart';
import 'package:equatable/equatable.dart';
import '../models/models.dart';

class CommunityEntity extends Equatable {
  final String about;
  final Address location;
  final String name;
  final List<Project> projects;

  CommunityEntity(this.about, this.location, this.name, this.projects);

  static Future<CommunityEntity> fromSnapshot(DocumentSnapshot snap) async {
    final Map<String, dynamic> snapData = snap.data() as Map<String, dynamic>;

    final DocumentSnapshot snapLocation = await snapData['location'].get();
    final Address address =
        Address.fromEntity(AddressEntity.fromSnapshot(snapLocation));

    List snapList = snapData['projects'] ?? [];
    List<Project> projects = [];
    if (snapList.isNotEmpty) {
      projects = await Future.wait(snapList.map((elem) async {
        final DocumentSnapshot snapProject = await elem.get();
        return Project.fromEntity(
            await ProjectEntity.fromSnapshot(snapProject));
      }));
    }

    return CommunityEntity(
        snapData['about'], address, snapData['name'], projects);
  }

  @override
  List<Object> get props => [about, location, name];
}
