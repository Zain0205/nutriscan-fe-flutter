import 'package:dio/dio.dart';
import 'package:nutriscan_fe_flutter/services/secure_storage.dart';

class DioClient {
  late Dio dio;
  final SecureStorage secureStorage;

  DioClient({required this.secureStorage}) {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.nutriscan.co',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token = await secureStorage.getToken();
          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(options);
        },
        onResponse: (response, handler) => handler.next(response),
        onError: (DioException e, handler) => handler.next(e),
      ),
    );
  }

  Dio get instance => dio;
}
