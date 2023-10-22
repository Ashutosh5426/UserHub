import 'package:dio/dio.dart';

class ApiClient {
  late Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://reqres.in/api', // Your base API URL
        connectTimeout: const Duration(seconds: 5), // Timeout in seconds
        receiveTimeout: const Duration(seconds: 5), // Timeout in seconds
      ),
    );
  }

  Dio get dio => _dio;
}
