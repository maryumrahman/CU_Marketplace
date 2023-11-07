import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_visible_event.dart';
part 'search_visible_state.dart';

class SearchVisibleBloc extends Bloc<SearchVisibleEvent, SearchVisibleState> {
  SearchVisibleBloc() : super(SearchVisibleInitial()) {
    on<SearchVisibleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
