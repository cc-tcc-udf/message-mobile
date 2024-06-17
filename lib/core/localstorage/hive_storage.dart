import 'local_storage.dart';

class HiveStorage implements LocalStorage {
  HiveStorage({required String boxName});
  @override
  Future<bool> exists(String key) {
    throw UnimplementedError();
  }

  @override
  Future read(String key) {
    throw UnimplementedError();
  }

  @override
  Future<void> remove(String key) {
    throw UnimplementedError();
  }

  @override
  Future<void> removeAll() {
    throw UnimplementedError();
  }

  @override
  Future<void> write(String key, value) {
    throw UnimplementedError();
  }
}
