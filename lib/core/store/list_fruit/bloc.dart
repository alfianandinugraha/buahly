import 'package:buahly/core/exceptions/http_exception.dart';
import 'package:buahly/core/models/fruit.dart';
import 'package:buahly/core/providers/fruit_provider.dart';
import 'package:buahly/core/store/list_fruit/event.dart';
import 'package:buahly/core/store/list_fruit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListFruitBloc extends Bloc<ListFruitEvent, FruitState> {
  List<Fruit> _fruits = [];

  ListFruitBloc() : super(ListFruitEmpty()) {
    on<FetchListFruit>((event, emit) async {
      emit(ListFruitFetched());
      try {
        var fruits = await FruitProvider().getAll();
        _fruits = fruits;
        emit(ListFruitLoaded(fruits: fruits));
      } on HttpResponseException {
        emit(ListFruitError());
      } catch (err) {
        emit(ListFruitError());
      }
    });

    on<FilterListFruit>((event, emit) {
      if (state is ListFruitLoaded) {
        if (event.keyword.isEmpty) {
          emit(
            ListFruitLoaded(fruits: _fruits)
          );
        return;
        }

        final filteredFruits = _fruits
          .where((item) => item.name.toLowerCase().contains(event.keyword))
          .toList();

        emit(
          ListFruitLoaded(fruits: filteredFruits)
        );
      }
    });

    on<SearchListFruit>((event, emit) {
      emit(ListFruitLoaded(isSearch: event.isSearch, fruits: _fruits));
    });
  }
}
