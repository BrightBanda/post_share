import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PostService {
  final Dio dio;
  PostService(this.dio);

  final String base_url = "${dotenv.env['API_BASE_URL']}";

  Future<void> createPost({
    required String caption,
    required String? image_url,
    required String? token,
  }) async {
    try {
      final response = await dio.post(
        "$base_url/posts/",
        data: {"caption": caption, "image_url": image_url},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
    } on DioException catch (e) {
      final String serverMessage =
          e.response?.data["detail"] ?? "an unknown error occured";
      throw Exception(serverMessage);
    }
  }
}
