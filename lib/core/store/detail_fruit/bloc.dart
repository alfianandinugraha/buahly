import 'dart:convert';

import 'package:buahly/core/models/fruit.dart';
import 'package:buahly/core/repositories/fruit_repository.dart';
import 'package:buahly/core/store/detail_fruit/event.dart';
import 'package:buahly/core/store/detail_fruit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class DetailFruitBloc extends Bloc<DetailFruitEvent, DetailFruitState> {
  DetailFruitBloc() : super(DetailFruitEmpty()) {
    on<DetailFruitEvent>((event, emit) async {
      var box = await Hive.openBox("fruit");

      if (event is FetchDetailFruit) {
        var cachedFruitJSON = box.get(event.id);

        if (cachedFruitJSON != null) {
          var cachedFruit = json.decode(cachedFruitJSON);
          var duration = 5000;

          if (cachedFruit['time'] + duration > DateTime.now().millisecondsSinceEpoch) {
            var fruit = Fruit.fromMap(cachedFruit['body']);
            emit(DetailFruitLoaded(fruit: fruit));
            return;
          }
        }

        emit(DetailFruitFetched());

        try {
          var response = await FruitRepository().getById(event.id);
          var fruit = Fruit.fromJson(response.body);
          emit(DetailFruitLoaded(fruit: fruit));

          DateTime time = DateTime.now();
          Map<String, dynamic> cache = {
            'time': time.millisecondsSinceEpoch,
            'body': fruit.toMap()
          };
          box.put(event.id, json.encode(cache));
        } catch (err) {
          emit(DetailFruitError());
        } finally {
          // await box.close();
        }
      }
    });
  }
}
