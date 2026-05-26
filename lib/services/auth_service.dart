import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {
  final Dio dio;

  AuthService(this.dio);

  final String baseUrl = "${dotenv.env['API_BASE_URL']}";

  Future<void> register({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      await dio.post(
        "$baseUrl/auth/register",
        data: {"email": email, "username": username, "password": password},
      );
    } on DioException catch (e) {
      final String serverMessage =
          e.response?.data['detail'] ?? 'An unknown error occurred';
      throw Exception(serverMessage);
      print("Failed: $serverMessage");
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "${dotenv.env['API_BASE_URL']}/auth/login",
        data: FormData.fromMap({"username": email, "password": password}),
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      if (response.statusCode == 200 && response.data != null) {
        print(response.data["access_token"]);
        return response.data["access_token"] as String?;
      }
      return null;
    } on DioException catch (e) {
      final String serverMessage =
          e.response?.data['detail'] ?? 'An unknown error occurred';
      throw Exception(serverMessage);
      print("Failed: $serverMessage");
    }
  }
}
