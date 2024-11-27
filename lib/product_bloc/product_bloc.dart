import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_ground/api/product_list.dart';
import 'package:testing_ground/product_bloc/product_event.dart';
import 'package:testing_ground/product_bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState(products: List.from(ProductList.products))) {
    on<AddProductEvent>(_onAddProduct);
    on<RemoveProductEvent>(_onRemoveProduct);
  }

  void _onAddProduct(AddProductEvent event, Emitter<ProductState> emit){

  }

  void _onRemoveProduct(RemoveProductEvent event, Emitter<ProductState> emit){

  }

}