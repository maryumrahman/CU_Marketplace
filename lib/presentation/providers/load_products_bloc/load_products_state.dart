part of 'load_products_bloc.dart';

@immutable
abstract class LoadProductsState {}

class LoadProductsInitial extends LoadProductsState {}
class LoadedProductsState extends LoadProductsState {}
class FailuretoLoadState extends LoadProductsState {}
class LoadingProductsState extends LoadProductsState {}
