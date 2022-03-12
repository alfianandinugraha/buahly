import 'package:buahly/core/models/fruit.dart';

abstract class FruitState {}

class FruitInitial extends FruitState{}

class ListFruitEmpty extends FruitState {}

class ListFruitFetched extends FruitState {}

class ListFruitLoaded extends FruitState {
  final List<Fruit> fruits;

  ListFruitLoaded({required this.fruits});
}

class ListFruitError extends FruitState {}
