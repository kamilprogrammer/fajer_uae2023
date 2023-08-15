import 'package:dio/dio.dart';
import 'package:fajer/providers/auth.dart';

Dio dio() {
  var dio = Dio(
    BaseOptions(
      baseUrl: 'http://127.0.0.1:8000/api/',
      responseType: ResponseType.plain,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
      },
      validateStatus: (statusCode) {
        if (statusCode == null) {
          return false;
        }
        if (statusCode == 422) {
          // your http status code
          return true;
        } else {
          return statusCode >= 200 && statusCode < 300;
        }
      },
    ),
  );
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        requestghjfdghtr(options);
        return handler.next(options);
      },
    ),
  );
  return dio;
}

dynamic requestghjfdghtr(RequestOptions options) async {
  if (options.headers.containsKey('auth')) {
    var token = await Auth().getToken();
    options.headers..addAll({'Authrization': 'Barear $token'});
  }
}
