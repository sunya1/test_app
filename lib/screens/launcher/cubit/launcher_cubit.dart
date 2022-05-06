import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/constants/global_pref_constants.dart';
import 'package:test_app/screens/launcher/cubit/launcher_state.dart';

class LauncherCubit extends Cubit<LauncherState> {
  LauncherCubit() : super(InitialState());

  late SharedPreferences prefs;

  Future<void> checkForAccessToken() async {
    emit(LoadingState());
    prefs = await SharedPreferences.getInstance();

    final accessToken = prefs.getString(GlobalPrefConstants.accessTokenPref);
    if (accessToken != null) {
      emit(AuthorizedState());
    } else {
      emit(NotYetAuthorizedState());
    }
  }
}
