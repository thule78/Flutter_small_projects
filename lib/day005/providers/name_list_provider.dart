import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../models/name_item.dart';
import '../models/name_repository.dart';
import '../utils/validators.dart';

class NameListProvider extends ChangeNotifier {
  NameListProvider(this._repo);

  final NameRepository _repo;
  final Uuid _uuid = const Uuid();

  final List<NameItem> _items = [];
  List<NameItem> get items => List.unmodifiable(_items);

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  String? _error;
  String? get error => _error;

  Future<void> load() async {
    try {
      final loaded = await _repo.loadItems();
      _items
        ..clear()
        ..addAll(loaded);
      _isLoaded = true;
      _error = null;
      notifyListeners();
    } catch (e) {
      _error = 'Failed to load items';
      _isLoaded = true;
      notifyListeners();
    }
  }

  Future<bool> add(String name) async {
    final validation = Validators.validateName(name);
    if (validation != null) {
      _error = validation;
      notifyListeners();
      return false;
    }

    final item = NameItem(
      id: _uuid.v4(),
      name: name.trim(),
      createdAt: DateTime.now(),
    );

    _items.add(item);

    try {
      await _repo.saveItems(_items);
      _error = null;
      notifyListeners();
      return true;
    } catch (e) {
      // rollback if save fails
      _items.removeWhere((x) => x.id == item.id);
      _error = 'Failed to save item';
      notifyListeners();
      return false;
    }
  }

  Future<void> removeById(String id) async {
    final index = _items.indexWhere((e) => e.id == id);
    if (index == -1) return;

    final removed = _items.removeAt(index);
    notifyListeners();

    try {
      await _repo.saveItems(_items);
      _error = null;
      notifyListeners();
    } catch (e) {
      // rollback if save fails
      _items.insert(index, removed);
      _error = 'Failed to delete item';
      notifyListeners();
    }
  }

  Future<void> clearAll() async {
    final backup = List<NameItem>.from(_items);
    _items.clear();
    notifyListeners();

    try {
      await _repo.clearAll();
      _error = null;
      notifyListeners();
    } catch (e) {
      // rollback if clear fails
      _items
        ..clear()
        ..addAll(backup);
      _error = 'Failed to clear list';
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}