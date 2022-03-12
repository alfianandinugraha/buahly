import 'package:buahly/core/cache/detail_fruit.dart';
import 'package:buahly/core/models/fruit.dart';
import 'package:buahly/core/repositories/fruit_repository.dart';
import 'package:buahly/core/store/detail_fruit/event.dart';
import 'package:buahly/core/store/detail_fruit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailFruitBloc extends Bloc<DetailFruitEvent, DetailFruitState> {
  DetailFruitBloc() : super(DetailFruitEmpty()) {
    on<DetailFruitEvent>((event, emit) async {
      if (event is FetchDetailFruit) {
        var cacheFruitBox = DetailFruitCache(id: event.id);
        await cacheFruitBox.open();

        var cacheFruit = cacheFruitBox.get();
        if (cacheFruit != null) {
          emit(DetailFruitLoaded(fruit: cacheFruit));
          return;
        }

        emit(DetailFruitFetched());

        try {
          var response = await FruitRepository().getById(event.id);
          var fruit = Fruit.fromJson(response.body);
          emit(DetailFruitLoaded(fruit: fruit));

          cacheFruitBox.store(fruit).then((value) => cacheFruitBox.close());
        } catch (err) {
          emit(DetailFruitError());
          cacheFruitBox.close();
        }
      }
    });
  }
}
