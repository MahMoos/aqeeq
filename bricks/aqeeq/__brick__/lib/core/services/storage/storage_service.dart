import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_storage_service.dart';
part 'storage_service.g.dart';

/// Provider that maps an [StorageService] interface to implementation
@riverpod
Future<StorageService> storageService(StorageServiceRef ref) async {
  final service = SharedPreferencesStorageService();
  await service.init();
  return service;
}

/// Storage service interface
abstract class StorageService {
  /// Initializes service
  Future<void> init();

  /// Retrieves item of type [T] from storage by a key
  Future<T?> get<T>(String key);

  /// Retrieves all items from storage
  Future<List<T?>> getAll<T>();

  /// Checks if an item of type [T] exists in storage by a key
  bool has<T>(String key);

  /// Sets an item data of type [T] in storage
  Future<bool> set<T>(String key, T data);

  /// Removes item of type [T] from storage by a key
  Future<bool> remove<T>(String key);

  /// Removes items of type [T] from storage
  /// if supplied with [keys] it will delete only the items with these keys
  Future<int> removeAll<T>([List<String>? keys]);

  /// Clears storage
  Future<void> clear();

  /// Terminates service
  Future<void> close();
}
