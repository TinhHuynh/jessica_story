import 'package:dio/dio.dart';

import 'api_interceptors.dart';

class DioHandler {
  final String apiBaseUrl;

  DioHandler({required this.apiBaseUrl});

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 30),
    );
    options.headers = _defaultHeader();
    final dio = Dio(options);
    dio.interceptors.add(ApiInterceptors());

    return dio;
  }

  Map<String, dynamic> _defaultHeader() {
    Map<String, String> headers = {};
    headers['Content-Type'] = 'application/json';
    return headers;
  }
}
