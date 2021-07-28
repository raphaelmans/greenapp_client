import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waste_material_repository/waste_material_repository.dart';

part 'material_state.dart';

class MaterialCubit extends Cubit<MaterialState> {
  MaterialCubit() : super(MaterialInitial());

  selectMaterial(material) {
    emit(MaterialSelected(material));
  }

  deselectMaterial() {
    emit(MaterialInitial());
  }
}
