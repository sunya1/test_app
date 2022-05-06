import 'package:dio/dio.dart';

import '../network/network_routes.dart';

class ShymbulakService {
  final Future<Dio> _httpClient;
  ShymbulakService(this._httpClient);

  Future<Response> authUser(String email , String password) async {
    final _response = await _httpClient;
    return _response.post(
      NetworkCallRoutes.authUser,
      data: {
        'email': email , 
        'password': password
      }
    );
  }

  Future<Response> getAllActivities() async {
    final _response = await _httpClient;
    return _response.get(
      NetworkCallRoutes.getAllTraffics,
    );
  }

}