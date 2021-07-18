part of 'material_cubit.dart';

abstract class MaterialState extends Equatable {
  const MaterialState();

  @override
  List<Object> get props => [];
}

class MaterialInitial extends MaterialState {}

class MaterialSelected extends MaterialState {
  final WasteMaterial material;

  const MaterialSelected(this.material);

  @override
  List<Object> get props => [material];
}
