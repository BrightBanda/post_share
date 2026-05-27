import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_share/providers/auth_service_provider.dart';
import 'package:post_share/providers/feed_provider.dart';
import 'package:post_share/providers/post_service_provider.dart';
import 'package:post_share/providers/secure_storage_providers.dart';
import 'package:post_share/services/post_service.dart';

class CreatePostPageViewmodel extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() {
    return "";
  }

  Future<void> createPost({
    required String caption,
    required String image_url,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final PostService = ref.read(postServiceProvider);
      await PostService.createPost(caption: caption, image_url: image_url);
      ref.invalidate(feedProvider);
      return " Success";
    });
  }
}

final createPostProvider =
    AsyncNotifierProvider<CreatePostPageViewmodel, String>(
      CreatePostPageViewmodel.new,
    );
