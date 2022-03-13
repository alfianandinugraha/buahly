abstract class ListFruitEvent {}

class FetchListFruit extends ListFruitEvent {}

class FilterListFruit extends ListFruitEvent {
  final String keyword;

  FilterListFruit({required this.keyword});
}

class SearchListFruit extends ListFruitEvent {
  bool isSearch;

  SearchListFruit({required this.isSearch});
}
