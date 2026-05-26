import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_share/providers/dio_provider.dart';
import 'package:post_share/services/auth_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthService(dio);
});
