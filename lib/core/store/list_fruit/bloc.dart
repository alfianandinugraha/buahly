import 'dart:convert';

import 'package:buahly/core/models/fruit.dart';
import 'package:buahly/core/repositories/fruit_repository.dart';
import 'package:buahly/core/store/list_fruit/event.dart';
import 'package:buahly/core/store/list_fruit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListFruitBloc extends Bloc<FruitEvent, FruitState> {
  ListFruitBloc() : super(ListFruitEmpty()) {
    on<FetchListFruit>((event, emit) async {
      emit(ListFruitFetched());
      try {
        var response = await FruitRepository().getAll();
        var body = json.decode(response.body) as List;
        var fruits = List<Fruit>.from(body.map((e) => Fruit.fromMap(e)));
        emit(ListFruitLoaded(fruits: fruits));
      } catch (err) {
        emit(ListFruitError());
      }
    });
  }
}
