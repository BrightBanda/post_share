import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_share/providers/dio_provider.dart';
import 'package:post_share/services/post_service.dart';

final postServiceProvider = Provider<PostService>((ref) {
  final dio = ref.watch(dioProvider);
  return PostService(dio);
});
