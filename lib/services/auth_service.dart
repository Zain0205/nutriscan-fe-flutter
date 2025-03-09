import 'package:dio/dio.dart';
import 'package:nutriscan_fe_flutter/core/dio_client.dart';
import 'package:nutriscan_fe_flutter/core/secure_storage_service.dart';

class AuthService {
  final DioClient dioClient;
  final SecureStorageService secureStorageService;

  AuthService({required this.dioClient, required this.secureStorageService});

  Future<void> register(
      {required String email,
      required String name,
      required String password,
      required int age,
      required double weight,
      required double height,
      required String goal}) async {
    try {
      final Response response = await dioClient.instance.post(
        '/api/register',
        data: {
          'email': email,
          'name': name,
          'password': password,
          'age': age,
          'weight': weight,
          'height': height,
          'goal': goal
        },
      );

      if (response.statusCode == 201) {
        final token = response.data['token'];
        await secureStorageService.saveToken(token);
      } else {
        throw Exception(response.data['message']);
      }
    } catch (e) {
      throw Exception("Error registering: ${e.toString()}");
    }
  }
}
