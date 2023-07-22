import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

String changeBaseUrlFromPlatform() {
  if (Platform.isAndroid) return 'http://192.168.1.67:8080/';
  return 'http://localhost:8080/';
}

final Provider<Dio> dioProvider = Provider(
  (ref) {
    final Dio dio = Dio(
      BaseOptions(baseUrl: changeBaseUrlFromPlatform()),
    );
    dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true));
    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, requestInterceptorHandler) {
          options.headers = {
            'Content-Type': Headers.jsonContentType,
          };
          requestInterceptorHandler.next(options);
        },
        onResponse: (response, requestInterceptorHandler) => requestInterceptorHandler.next(response),
        onError: (error, requestInterceptorHandler) => requestInterceptorHandler.next(error),
      ),
    );
    return dio;
  },
);
