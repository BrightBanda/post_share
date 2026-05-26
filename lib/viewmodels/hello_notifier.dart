import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_share/providers/api_service_provider.dart';

class HelloNotifier extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() async {
    // final api = ref.watch(apiServiceProvider);
    // return await api.getHello();
    return "click to load message";
  }

  Future<void> refreshHello() async {
    final api = ref.watch(apiServiceProvider);
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return await api.getHello();
    });
  }
}

final helloProvider = AsyncNotifierProvider<HelloNotifier, String>(
  HelloNotifier.new,
);
