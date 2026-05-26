import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_share/viewmodels/hello_notifier.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HelloState = ref.watch(helloProvider);
    return Scaffold(
      body: Center(
        child: HelloState.when(
          data: (data) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(data),
              ElevatedButton(
                onPressed: () {
                  ref.read(helloProvider.notifier).refreshHello();
                },
                child: Text("Load Message"),
              ),
            ],
          ),
          error: (error, _) => Text("error: $error"),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
