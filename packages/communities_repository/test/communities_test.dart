import 'package:communities_repository/communities_repository.dart';
import 'package:test/test.dart';

void main() {
  group('Communities Test', () {
    late final CommunitiesRepository communitiesRepository;

    setUp(() {
      communitiesRepository = FirebaseCommunitiesRepository();
    });

    communitiesRepository.communities().listen((event) {
      print(event);
    });
  });
}
