part of 'load_products_bloc.dart';

@immutable
abstract class LoadProductsEvent {}
class LoadProducts extends LoadProductsEvent {}
class FilterProducts extends LoadProductsEvent {
  SearchProductsModel? obj;
  BuildContext? context;
  FilterProducts({required context,required obj});
}
class LoadProductsSearch extends LoadProductsEvent {
  List<categoryOfProducts>? displayList;
  LoadProductsSearch({required displayList});
}
class LoadProductsPullToRefresh extends LoadProductsEvent {
  bool? isLoaded;
  LoadProductsPullToRefresh({required isLoaded});
}
