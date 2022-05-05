import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(AuthState initialState) : super(initialState);
  
  Future<void> authUser() async {
    
  }
}