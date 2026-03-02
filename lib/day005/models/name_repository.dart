import 'dart:convert';

import '../core/storage_keys.dart';
import 'local_storage.dart';
import 'name_item.dart';

class NameRepository {
  NameRepository(this._storage);

  final LocalStorage _storage;

  Future<List<NameItem>> loadItems() async {
    final raw = await _storage.readString(StorageKeys.nameList);
    if (raw == null || raw.isEmpty) return [];

    final decoded = jsonDecode(raw) as List<dynamic>;
    return decoded
        .map((e) => NameItem.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveItems(List<NameItem> items) async {
    final encoded = jsonEncode(items.map((e) => e.toJson()).toList());
    await _storage.writeString(StorageKeys.nameList, encoded);
  }

  Future<void> clearAll() async {
    await _storage.remove(StorageKeys.nameList);
  }
}