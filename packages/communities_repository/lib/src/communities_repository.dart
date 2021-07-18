import 'package:communities_repository/communities_repository.dart';

abstract class CommunitiesRepository {
  Future<void> addNewCommunity(Community community);
  Future<void> deleteCommunity(Community community);
  Stream<List<Community>> communities();
  Future<void> updateCommunity(Community community);
}
