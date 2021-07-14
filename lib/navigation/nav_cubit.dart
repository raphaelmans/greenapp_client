import 'package:flutter_bloc/flutter_bloc.dart';

enum NavScreen { intro, home, profile, community, shop }

class NavCubit extends Cubit<NavScreen> {
  NavCubit() : super(NavScreen.intro);

  void navigateTo(NavScreen screen) => emit(screen);
}
