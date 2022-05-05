import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/di/di_locator.dart';
import 'package:test_app/domain/auth/use_case/auth_use_case.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : _authUserUseCase = locator(),
        super(InitialState());
  AuthUserUseCase _authUserUseCase;

  final TextEditingController _textEmailController = TextEditingController();
  TextEditingController get getTextEmailController => _textEmailController;

  final TextEditingController _textPasswordController = TextEditingController();
  TextEditingController get getTextPasswordController =>
      _textPasswordController;

  late SharedPreferences prefs;
  Future<void> authUser() async {
    if (_textEmailController.text.isNotEmpty &&
        _textPasswordController.text.isNotEmpty) {
      try {
        emit(LoadingState());
        final _res = await _authUserUseCase.call(
            _textEmailController.text, _textPasswordController.text);
        print(_res.accessToken + " hererere");
        emit(AuthSuccessState(accessToken: _res.accessToken));
      } catch (e) {
        emit(ErrorState(error: e.toString()));
      }
    } else {
      emit(FillAllFieldsState());
    }
  }

  void setAccessToken(String accessToken) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('accessToken', accessToken);
  }

  void setShowPassword(bool isObscureText) {
    emit(ShowPasswordState(isObscureText: isObscureText));
  }
}
