import 'dart:io';
import 'package:dio/dio.dart';
import 'package:nutriscan_fe_flutter/core/dio_client.dart';
import 'package:nutriscan_fe_flutter/models/nutrition_model.dart';
import 'package:http_parser/http_parser.dart';

class ScannerService {
  final DioClient _dioClient;

  ScannerService({required DioClient dioClient}) : _dioClient = dioClient;

  Future<NutritionAnalysis> scanFood(File imageFile) async {
    try {
      // Prepare form data
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          imageFile.path,
          filename: 'food_image.jpg',
          contentType: MediaType('image', 'jpeg'),
        ),
      });

      // Make API call
      Response response = await _dioClient.instance.post(
        '/api/food-scanner',
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );

      if (response.statusCode == 200) {
        return NutritionAnalysis.fromJson(response.data);
      } else {
        throw Exception('Failed to scan food: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('API Error: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        throw Exception('Network Error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}