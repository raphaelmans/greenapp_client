import 'package:equatable/equatable.dart';
import 'package:waste_material_repository/waste_material_repository.dart';

class WasteMaterial extends Equatable {
  final String about;
  final String name;

  WasteMaterial(this.about, this.name);

  static WasteMaterial fromEntity(WasteMaterialEntity entity) {
    return WasteMaterial(entity.about, entity.name);
  }

  @override
  List<Object> get props => [about, name];
}
