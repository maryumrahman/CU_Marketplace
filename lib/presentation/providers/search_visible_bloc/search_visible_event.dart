part of 'search_visible_bloc.dart';

@immutable
abstract class SearchVisibleEvent {}
 class ToggleSearch extends SearchVisibleEvent {
  bool? isVisible;
  ToggleSearch({required isVisible});
 }
