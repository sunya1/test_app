import 'package:dio/dio.dart';
import 'package:test_app/network/interceptor/token_interceptor.dart';

Future<Dio> createAuthorizedHttpClient(String baseUrl) async {
  Dio dio = Dio();
  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = 80000;
  dio.options.receiveTimeout = 50000;
  dio.interceptors.add(TokenInterceptor());
  return dio;
}
