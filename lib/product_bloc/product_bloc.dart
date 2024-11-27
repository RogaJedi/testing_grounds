import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_ground/api/cart_list.dart';
import 'package:testing_ground/api/product_list.dart';
import 'package:testing_ground/models/product.dart';
import 'package:testing_ground/product_bloc/product_event.dart';
import 'package:testing_ground/product_bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState(products: List.from(ProductList.products))) {
    on<AddProductEvent>(_onAddProduct);
    on<RemoveProductEvent>(_onRemoveProduct);
    on<EditProductEvent>(_onEditProduct);
  }

  void _onAddProduct(AddProductEvent event, Emitter<ProductState> emit){
    ProductList.addProduct(Product(
        productId: event.productId,
        name: event.name,
        imageUrl: event.imageUrl,
        description: event.description,
        price: event.price,
        stock: event.stock
    ));
    emit(ProductState(products: List.from(ProductList.products)));

  }

  void _onEditProduct(EditProductEvent event, Emitter<ProductState> emit) {
    ProductList.editProduct(
        productId: event.productId,
        name: event.name,
        imageUrl: event.imageUrl,
        description: event.description,
        price: event.price,
        stock: event.stock
    );
    emit(ProductState(products: List.from(ProductList.products)));
  }

  void _onRemoveProduct(RemoveProductEvent event, Emitter<ProductState> emit){
    ProductList.removeProduct(event.productId);
    emit(ProductState(products: List.from(ProductList.products)));

  }
}