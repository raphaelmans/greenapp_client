import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:greenapp/app/app.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/login/login.dart';
import 'package:greenapp/sign_up/sign_up.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Authentication Failure'),
              ),
            );
        }
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: RichText(
              text: TextSpan(
                text: 'Hi,\n',
                style: kIntroHeadingStyle(context),
                children: const <TextSpan>[
                  TextSpan(text: 'Welcome!'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          _EmailInput(),
          const SizedBox(height: 8.0),
          _PasswordInput(),
          const SizedBox(height: 8.0),
          Spacer(),
          _LoginButton(),
          // RadioListTile(
          //     contentPadding: EdgeInsets.zero,
          //     title: Text('Remember Me'),
          //     toggleable: true,
          //     value: 'Remember Me',
          //     groupValue: 'qweqeq',
          //     onChanged: (_) => null),
          const SizedBox(height: 12.0),
          _SignUpButton(),
          const SizedBox(height: 16.0),
          _GoogleLoginButton(),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Enter Email Address',
            helperText: '',
            errorText: state.email.invalid ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Enter Password',
            helperText: '',
            errorText: state.password.invalid ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator(color: Color(0xFF40B861))
            : TextButton(
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: state.status.isValidated
                    ? () => context.read<LoginCubit>().logInWithCredentials()
                    : null,
                child: const Text('Sign In'),
              );
      },
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 40.0,
      height: 40.0,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        iconSize: 18.0,
        key: const Key('loginForm_googleLogin_raisedButton'),
        icon: const Icon(FontAwesomeIcons.google),
        onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('Do not have an account? '),
      GestureDetector(
        key: const Key('loginForm_createAccount_flatButton'),
        onTap: () => Navigator.of(context).push<void>(SignUpPage.route()),
        child: Text('Sign Up',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            )),
      ),
    ]);
  }
}
