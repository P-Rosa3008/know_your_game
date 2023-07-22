import 'dart:io';

import 'package:mocktail/mocktail.dart';

export 'package:dio/dio.dart';

export './mocks/dio_mocks.dart';
export './mocks/questions_page_mocks.dart';
export './router/router.dart';

class MockHttpClient extends Mock implements HttpClient {}

void configureFallback() {
  HttpOverrides.global = null;
  HttpOverrides.runZoned(
    () {},
    createHttpClient: (securityContext) => MockHttpClient(),
  );
}
