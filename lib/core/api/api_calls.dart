import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_hub/core/api/api_client.dart';

class ApiCalls {
  final ApiClient apiClient = ApiClient();

  ApiCalls();

  Future<Response> getUsers({required int page}) async {
    try {
      final response = await apiClient.dio.get(
        '/users',
        queryParameters: {
          "page": page,
        },
      );
      debugPrint(response.toString());
      return response;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<Response> getUserInfo(int userId) async {
    try {
      final response = await apiClient.dio.get('/users/$userId');
      debugPrint(response.toString());
      return response;
    } catch (error) {
      throw Exception(error);
    }
  }
}