import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_share/providers/secure_storage_providers.dart';
import 'package:post_share/services/auth_interceptor.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options = BaseOptions(
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  );
  final storageService = ref.read(storageServiceProvider);
  dio.interceptors.add(AuthInterceptor(storageService));
  return dio;
});
