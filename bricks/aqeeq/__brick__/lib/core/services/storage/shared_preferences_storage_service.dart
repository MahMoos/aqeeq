part of 'storage_service.dart';

class SharedPreferencesStorageService implements StorageService {
  // SharedPreferencesStorageService() {
  //   init();
  // }
  late SharedPreferences _preferences;

  @override
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  Future<void> clear() async {
    await _preferences.clear();
  }

  @override
  Future<void> close() {
    throw UnimplementedError();
  }

  @override
  Future<T?> get<T>(String key) async {
    return _preferences.get(key) as T?;
  }

  @override
  Future<List<T?>> getAll<T>() {
    // TODO(MahMoos): implement getAll
    throw UnimplementedError();
  }

  @override
  bool has<T>(String key) {
    return _preferences.getKeys().contains(key);
  }

  @override
  Future<bool> remove<T>(String key) {
    return _preferences.remove(key);
  }

  @override
  Future<int> removeAll<T>([List<String>? keys]) async {
    var removedItems = 0;
    if (keys != null) {
      for (final key in keys) {
        final result = await _preferences.remove(key);
        if (result) removedItems++;
      }
    } else {
      removedItems = _preferences.getKeys().length;
      final result = await _preferences.clear();
      if (!result) removedItems = 0;
    }
    return removedItems;
  }

  @override
  Future<bool> set<T>(String key, T data) {
    switch (data.runtimeType) {
      case String:
        return _preferences.setString(key, data as String);
      case int:
        return _preferences.setInt(key, data as int);
      case double:
        return _preferences.setDouble(key, data as double);
      case bool:
        return _preferences.setBool(key, data as bool);
      case List:
        return _preferences.setStringList(key, data as List<String>);
      default:
        throw UnimplementedError();
    }
  }
}
