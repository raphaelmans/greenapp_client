import 'package:equatable/equatable.dart';
import 'package:waste_material_repository/waste_material_repository.dart';

class WasteMaterial extends Equatable {
  final String about;
  final String name;
  String? imageLink;
  String? disposal;

  WasteMaterial(this.about, this.name,
      [this.imageLink =
          'https://images.unsplash.com/photo-1536939459926-301728717817?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
      this.disposal =
          'Put the plastic bottle inside the non-biodegradble portion of your garbage bin.']);

  static WasteMaterial fromEntity(WasteMaterialEntity entity) {
    return WasteMaterial(entity.about, entity.name);
  }

  @override
  List<Object> get props => [about, name];
}
