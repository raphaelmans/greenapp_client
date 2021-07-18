import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communities_repository/communities_repository.dart';

class FirebaseCommunitiesRepository implements CommunitiesRepository {
  final communitiesCollection =
      FirebaseFirestore.instance.collection('communities');

  @override
  Future<void> addNewCommunity(Community community) {
    // TODO: implement addNewCommunity
    throw UnimplementedError();
  }

  @override
  Stream<List<Community>> communities() async* {
    Stream<QuerySnapshot> collectionStream = communitiesCollection.snapshots();

    yield* collectionStream.asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) async {
        CommunityEntity communityEntity =
            await CommunityEntity.fromSnapshot(doc);
        Community community = Community.fromEntity(communityEntity);
        return community;
      }));
    });
  }

  @override
  Future<void> deleteCommunity(Community community) {
    // TODO: implement deleteCommunity
    throw UnimplementedError();
  }

  @override
  Future<void> updateCommunity(Community community) {
    // TODO: implement updateCommunity
    throw UnimplementedError();
  }
}
