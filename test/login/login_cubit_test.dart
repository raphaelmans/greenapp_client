import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:greenapp/login/cubit/login_cubit.dart';

void main() {
  group('Login Cubit', () {
    late AuthenticationRepository authenticationRepository;
    late LoginState mockLoginState;
    setUp(() async {
      authenticationRepository = AuthenticationRepository();
      mockLoginState = const LoginState(
          email: Email.dirty('raphaelmansueto@gmail.com'),
          password: Password.pure(),
          status: FormzStatus.invalid);
    });
    blocTest('emits [MyState] when MyEvent is added.',
        build: () => LoginCubit(authenticationRepository),
        act: (LoginCubit cubit) =>
            cubit.emailChanged('raphaelmansueto@gmail.com'),
        expect: () => [mockLoginState]);
  });
}
