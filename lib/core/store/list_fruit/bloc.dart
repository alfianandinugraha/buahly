import 'dart:convert';

import 'package:buahly/core/models/fruit.dart';
import 'package:buahly/core/repositories/fruit_repository.dart';
import 'package:buahly/core/store/list_fruit/event.dart';
import 'package:buahly/core/store/list_fruit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListFruitBloc extends Bloc<ListFruitEvent, FruitState> {
  List<Fruit> _fruits = [];

  ListFruitBloc() : super(ListFruitEmpty()) {
    on<FetchListFruit>((event, emit) async {
      emit(ListFruitFetched());
      try {
        var response = await FruitRepository().getAll();
        var body = json.decode(response.body) as List;
        var fruits = List<Fruit>.from(body.map((e) => Fruit.fromMap(e)));
        _fruits = fruits;
        emit(ListFruitLoaded(fruits: fruits));
      } catch (err) {
        print(err);
        emit(ListFruitError());
      }
    });

    on<FilterListFruit>((event, emit) {
      if (state is ListFruitLoaded) {
        final filteredFruits = _fruits
          .where((item) => item.name.toLowerCase().contains(event.keyword))
          .toList();

        emit(
          ListFruitLoaded(fruits: filteredFruits)
        );
      }
    });
  }
}
