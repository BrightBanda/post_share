import 'package:dio/dio.dart';
import 'package:post_share/services/storage_service.dart';

class AuthInterceptor extends Interceptor {
  final StorageService _storageService;
  AuthInterceptor(this._storageService);

  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = await _storageService.getToken();

    if (token != null && token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
    }
    return handler.next(options);
  }
}
