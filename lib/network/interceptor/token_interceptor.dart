import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/screens/auth/cubit/auth_cubit.dart';

class TokenInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print(options.baseUrl + options.path);
    final pref = await SharedPreferences.getInstance();
    final accessToken = pref.getString('accessToken');
    if (accessToken == null) {
      return super.onRequest(options, handler);
    }
    options.headers["Authorization"] = "Bearer " + accessToken;
    print("************************************************");
    print(options.headers.toString());
    return super.onRequest(options, handler);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) {
    // var url = err.request.uri;
    print("************************************************");
    print(err);

    super.onError(err, handler);
    AuthCubit auth = AuthCubit();

    if (err.response?.statusCode == 401) {
      auth.logOut();
    }
  }
}
