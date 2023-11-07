part of 'search_visible_bloc.dart';

@immutable
abstract class SearchVisibleState {}

class SearchVisibleInitial extends SearchVisibleState {}

class SearchVisibleDataState extends SearchVisibleState {
 bool  isVisible=false;
  SearchVisibleDataState({required isVisible});
}
