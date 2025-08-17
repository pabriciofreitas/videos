import 'package:dio/dio.dart';
import 'package:videos/core/app_print.dart';

class ApiService {
  ApiService._();

  static final ApiService instance = ApiService._();

  static const String baseUrl = String.fromEnvironment("API_URL");
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      responseType: ResponseType.json,
    ),
  );

  Future<Response> get(String path, {String? customBaseUrl}) async {
    try {
      final url = (customBaseUrl ?? baseUrl) + path;
      final response = await _dio.get(url);
      console('GET URL: $url');
      console('RESPONSE BODY : ${response.data}');
      console('STATUS CODE : ${response.statusCode}');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String path, {
    required Map<String, dynamic> data,
    String? customBaseUrl,
  }) async {
    try {
      final url = (customBaseUrl ?? baseUrl) + path;
      final response = await _dio.post(url, data: data);
      console('POST URL: $url');
      console('RESPONSE BODY : ${response.data}');
      console('STATUS CODE : ${response.statusCode}');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> patch(
    String path, {
    required Map<String, dynamic> data,
    String? customBaseUrl,
  }) async {
    try {
      final url = (customBaseUrl ?? baseUrl) + path;
      final response = await _dio.patch(url, data: data);
      console('PATCH URL: $url');
      console('RESPONSE BODY : ${response.data}');
      console('STATUS CODE : ${response.statusCode}');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
