import 'package:communities_repository/communities_repository.dart';
import 'package:greenapp/community/community.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

void main(List<String> args) {
  group('Communities Bloc', () {
    blocTest<CommunitiesBloc, CommunitiesState>(
      'emits [MyState] when MyEvent is added.',
      build: () => CommunitiesBloc(
          communitiesRepository: FirebaseCommunitiesRepository()),
      act: (CommunitiesBloc bloc) => bloc.add(LoadCommunities()),
      expect: () => const <CommunitiesState>[CommunitiesLoaded()],
    );
  });
  // group('Login Cubit', () {
  //   late AuthenticationRepository authenticationRepository;
  //   late LoginState mockLoginState;
  //   setUp(() async {
  //     authenticationRepository = AuthenticationRepository();
  //     mockLoginState = const LoginState(
  //         email: Email.dirty('raphaelmansueto@gmail.com'),
  //         password: Password.pure(),
  //         status: FormzStatus.invalid);
  //   });
  //   blocTest('emits [MyState] when MyEvent is added.',
  //       build: () => LoginCubit(authenticationRepository),
  //       act: (LoginCubit cubit) =>
  //           cubit.emailChanged('raphaelmansueto@gmail.com'),
  //       expect: () => [mockLoginState]);
  // });
}
