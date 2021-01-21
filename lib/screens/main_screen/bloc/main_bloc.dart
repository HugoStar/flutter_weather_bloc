import 'package:flutter_weather_bloc/utils/bloc_utils/base_bloc.dart';

enum MainBlocEvents { openTapBarScreen }

abstract class IMainBloc extends BlocBase<MainBlocEvents> {
  void showTabBar();
}

class MainBloc extends IMainBloc {
  @override
  void showTabBar() {
    inUiEvents.add(BlocEvent(type: MainBlocEvents.openTapBarScreen));
  }
}
