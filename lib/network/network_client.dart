import 'package:dio/dio.dart';

Future<Dio> createAuthorizedHttpClient(String baseUrl) async {
  Dio dio = Dio();
  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = 80000;
  dio.options.receiveTimeout = 50000;

  // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //     (HttpClient client) {
  //   client.badCertificateCallback =
  //       (X509Certificate cert, String host, int port) => true;
  //   return client;
  // };

  return dio;
}