

import 'package:test_app/data/auth/models/user_info.dart';
import 'package:test_app/di/di_locator.dart';
import 'package:test_app/services/shymbulak_service.dart';

class AuthRepository {
  final ShymbulakService _apiService;

  AuthRepository() : _apiService = locator();

  Future<UserInfo> authUser(String email , String password) async {
    final response = await _apiService.authUser(email , password);
    final json = response.data;

    return userInfoFromJson(json);
    
  }
}