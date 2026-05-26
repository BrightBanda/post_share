import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:post_share/services/storage_service.dart';

// Provides the raw secure storage instance
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage(
    // AndroidOptions help prevent decryption bugs on certain Android devices
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
});

// Provides our storage service wrapper
final storageServiceProvider = Provider<StorageService>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return StorageService(secureStorage);
});
