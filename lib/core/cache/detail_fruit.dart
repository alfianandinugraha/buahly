import 'dart:convert';

import 'package:buahly/core/models/fruit.dart';
import 'package:hive/hive.dart';

class DetailFruitCache {
  final DateTime cacheTime = DateTime.now();
  final int id;
  late Box _box;

  static const Duration duration = Duration(seconds: 7);
  static const String boxName = "fruit";

  DetailFruitCache({required this.id});

  Future<Box> open() async {
    final box = await Hive.openBox(DetailFruitCache.boxName);
    _box = box;
    return box;
  }

  Future<void> store(Fruit fruit) async {
    DateTime time = DateTime.now();

    var fruitMap = fruit.toMap();

    Map<String, dynamic> cache = {
      'time': time.millisecondsSinceEpoch,
      'body': fruitMap
    };

    await _box.put(fruit.id, json.encode(cache));
  }

  Fruit? get() {
    final millisecond = duration.inMilliseconds;

    var cache = _box.get(id);
    
    if (cache == null) return null;

    try {
      final decodedCache = json.decode(cache);
      if (decodedCache['time'] + millisecond > DateTime.now().millisecondsSinceEpoch) {
        Fruit result = Fruit.fromMap(decodedCache['body']);
        return result;
      }
    } catch(err) {
      print(err.toString());
      _box.delete(id);
    }

    return null;
  }

  clear() async {
    await _box.clear();
  }

  Future<void> close() async {
    await _box.close();
  }
}
