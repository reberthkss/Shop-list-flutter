import 'dart:convert';

import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';

    // Log the error request and error message
    print('onError: ${options.method} request => $requestPath');
    print('onError: ${err.error}, Message: ${err.message}');

    // Call the super class to continue handling the error
    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';

    // Log request details
    print(
        '\n\n\n\n.........................................................................');
    print('onRequest: ${options.method} request => $requestPath');
    print('onRequest: Request Headers => ${options.headers}');
    print('onRequest: Request Data => ${_prettyJsonEncode(options.data)}'); 
    
    // Log formatted request data

    // Call the super class to continue handling the request
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Log the response status code and data
    print(
        'onResponse: StatusCode: ${response.statusCode}, Data: ${_prettyJsonEncode(response.data)}'); // Log formatted response data
    print(
        '.........................................................................\n\n\n\n');

    // Call the super class to continue handling the response
    return super.onResponse(response, handler);
  }

  // Helper method to convert data to pretty JSON format
  String _prettyJsonEncode(dynamic data) {
    try {
      const encoder = JsonEncoder.withIndent('  ');
      final jsonString = encoder.convert(data);
      return jsonString;
    } catch (e) {
      return data.toString();
    }
  }
}