import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_share/providers/auth_service_provider.dart';

class RegisterViewmodel extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    //return non
  }

  Future<void> register({
    required String email,
    required String username,
    required String password,
  }) async {
    final authState = ref.watch(authServiceProvider);
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await authState.register(
        email: email,
        username: username,
        password: password,
      );
      print("register successfuly");
    });
  }
}

final registerProvider = AsyncNotifierProvider<RegisterViewmodel, void>(
  RegisterViewmodel.new,
);
