import 'package:dio/dio.dart';
import 'package:nutriscan_fe_flutter/core/secure_storage_service.dart';

class DioClient {
  late Dio dio;
  final SecureStorageService secureStorageService;

  DioClient({required this.secureStorageService}) {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:3000',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token = await secureStorageService.getToken();
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
