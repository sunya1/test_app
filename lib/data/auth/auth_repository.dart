

import 'package:test_app/di/di_locator.dart';
import 'package:test_app/services/shymbulak_service.dart';

class AuthRepository {
  final ShymbulakService _apiService;

  AuthRepository() : _apiService = locator();

  // Future<UserInfo> getTop250Movie() async {
  //   final response = await _apiService.authUser();
  //   final json = response.data;

  //   return popularMovieFromJson(json);
    
  // }
}