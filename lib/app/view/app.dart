import 'package:authentication_repository/authentication_repository.dart';
import 'package:communities_repository/communities_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenapp/app/app.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:greenapp/app/bloc/user_bloc.dart';
import 'package:greenapp/community/bloc/bloc.dart';
import 'package:greenapp/community/community.dart';
import 'package:greenapp/navigation/navigation.dart';

class App extends StatelessWidget {
  const App(
      {Key? key,
      required AuthenticationRepository authenticationRepository,
      required NavCubit navCubit})
      : _authenticationRepository = authenticationRepository,
        _navCubit = navCubit,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;
  final NavCubit _navCubit;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => CommunitiesBloc(
              communitiesRepository: FirebaseCommunitiesRepository(),
            )..add(LoadCommunities()),
          ),
          BlocProvider(create: (_) => _navCubit),
          BlocProvider(create: (_) => CommunityCubit()),
          BlocProvider(create: (_) => ProjectCubit()),
          BlocProvider(create: (_) => MaterialCubit()),
          BlocProvider(
            create: (_) => UserBloc(
              authenticationRepository: _authenticationRepository,
            ),
          ),
          BlocProvider(
            create: (_) => AppBloc(
                authenticationRepository: _authenticationRepository,
                navCubit: _navCubit),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: greenAppTheme,
      home: FlowBuilder<AppState>(
        state: context.select((AppBloc bloc) => bloc.state),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
