import 'package:buahly/core/cache/detail_fruit.dart';
import 'package:buahly/core/models/fruit.dart';
import 'package:buahly/core/providers/fruit_provider.dart';
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
          var fruit = await FruitProvider().getById(event.id);
          emit(DetailFruitLoaded(fruit: fruit));
        } catch (err) {
          emit(DetailFruitError());
        } finally {
          await cacheFruitBox.close();
        }
      }
    });

    on<CacheDetailFruit>((event, emit) async {
      var cacheFruitBox = DetailFruitCache(id: event.fruit.id);
      await cacheFruitBox.open();
      cacheFruitBox.store(event.fruit).then((value) => cacheFruitBox.close());
    });

    on<RefreshDetailFruit>((event, emit) async {
      if (state is DetailFruitLoaded) {
        var current = state as DetailFruitLoaded;
        final fruit = current.fruit;

        emit(DetailFruitFetched());

        try {
          var response = await FruitRepository().getById(fruit.id);
          var newFruit = Fruit.fromJson(response.body);
          emit(DetailFruitLoaded(fruit: newFruit));
        } catch (err) {
          emit(DetailFruitError());
        }
      }
    });
  }
}
