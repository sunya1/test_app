import 'package:test_app/data/auth/auth_repository.dart';
import 'package:test_app/data/auth/models/user_info.dart';
import 'package:test_app/di/di_locator.dart';

class AuthUserUseCase {
  AuthUserUseCase() : _authRepository = locator();

  final AuthRepository _authRepository;
  Future<UserInfo> call(String email, String password) async {
    final _result = await _authRepository.authUser(email, password);
    return _result;
  }
}
