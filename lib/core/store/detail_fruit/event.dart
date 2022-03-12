abstract class DetailFruitEvent {}

class FetchDetailFruit extends DetailFruitEvent {
  final int id;

  FetchDetailFruit({required this.id});
}
