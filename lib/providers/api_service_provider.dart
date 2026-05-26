import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_share/providers/dio_provider.dart';
import 'package:post_share/services/get_hello.dart';

final apiServiceProvider = Provider<GetHello>((ref) {
  final dio = ref.watch(dioProvider);
  return GetHello(dio);
});
