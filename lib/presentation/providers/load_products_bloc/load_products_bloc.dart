import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../configs/constants/extensions.dart';
import '../../../models/categoryOfProducts.dart';
import '../../../models/searchProductsModel.dart';


part 'load_products_event.dart';
part 'load_products_state.dart';

class LoadProductsBloc extends Bloc<LoadProductsEvent, LoadProductsState> {
  LoadProductsBloc() : super(LoadProductsInitial()) {
    on<LoadProductsEvent>((event, emit) {

      if(event is LoadProducts)
        {

        }



    });
  }
}
