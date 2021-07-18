import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class WasteMaterialEntity extends Equatable {
  final String about;
  final String name;

  WasteMaterialEntity(this.about, this.name);

  static WasteMaterialEntity fromSnapshot(DocumentSnapshot snap) {
    final Map<String, dynamic> snapData = snap.data() as Map<String, dynamic>;

    return WasteMaterialEntity(snapData['about'], snapData['name']);
  }

  @override
  List<Object> get props => [about, name];
}
