import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:waste_material_repository/waste_material_repository.dart';

class ProjectEntity extends Equatable {
  final String name;
  final String about;
  final List<WasteMaterial> materials;

  ProjectEntity(this.name, this.about, this.materials);

  static Future<ProjectEntity> fromSnapshot(DocumentSnapshot snap) async {
    final Map<String, dynamic> snapData = snap.data() as Map<String, dynamic>;

    List snapList = snapData['materials'];

    final materials = await Future.wait(snapList.map((elem) async {
      final DocumentSnapshot snapMaterial = await elem.get();
      return WasteMaterial.fromEntity(
          await WasteMaterialEntity.fromSnapshot(snapMaterial));
    }));

    return ProjectEntity(snapData['name'], snapData['about'], materials);
  }

  @override
  List<Object> get props => [name, about, materials];
}
