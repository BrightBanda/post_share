import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_share/providers/auth_service_provider.dart';

class LoginViewmodel extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> login(String email, String password) async {
    final authState = ref.read(authServiceProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final token = await authState.login(email: email, password: password);

      if (token == null) {
        throw Exception("Authentication failed: no token returned");
      }
    });
  }
}

final loginProvider = AsyncNotifierProvider<LoginViewmodel, void>(
  LoginViewmodel.new,
);
