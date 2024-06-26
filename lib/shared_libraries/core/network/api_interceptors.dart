import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestBody =
        const JsonEncoder.withIndent('  ').convert(options.data);
    final queryParameters =
        const JsonEncoder.withIndent('  ').convert(options.queryParameters);
    log(
      'Request URL : ${options.uri}\n'
      '----------------------------------------------------------------------\n'
      'Header: ${options.headers}\n'
      '----------------------------------------------------------------------\n'
      'Request Body: $requestBody\n'
      '----------------------------------------------------------------------\n'
      'Request Query Parameters: $queryParameters\n'
      '----------------------------------------------------------------------\n'
      'Method: ${options.method}\n',
    );
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final prettyString =
        const JsonEncoder.withIndent('  ').convert(response.data);
    log(
      'Status Code: ${response.statusCode}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Response : $prettyString\n',
    );
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('Dio Error : $err');
    return handler.next(err);
  }
}
