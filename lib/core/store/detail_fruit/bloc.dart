import 'package:buahly/core/models/fruit.dart';
import 'package:buahly/core/repositories/fruit_repository.dart';
import 'package:buahly/core/store/detail_fruit/event.dart';
import 'package:buahly/core/store/detail_fruit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailFruitBloc extends Bloc<DetailFruitEvent, DetailFruitState> {
  DetailFruitBloc() : super(DetailFruitEmpty()) {
    on<DetailFruitEvent>((event, emit) async {
      if (event is FetchDetailFruit) {
        emit(DetailFruitFetched());

        try {
          var response = await FruitRepository().getById(event.id);
          var fruit = Fruit.fromJson(response.body);
          emit(DetailFruitLoaded(fruit: fruit));
        } catch (err) {
          emit(DetailFruitError());
        }
      }
    });
  }
}
