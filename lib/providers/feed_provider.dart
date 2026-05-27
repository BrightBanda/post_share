import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_share/providers/post_service_provider.dart';
import 'package:post_share/services/post_service.dart';

final feedProvider = FutureProvider<List<dynamic>>((ref) async {
  final postService = ref.watch(postServiceProvider);
  return postService.fetchFeed();
});
