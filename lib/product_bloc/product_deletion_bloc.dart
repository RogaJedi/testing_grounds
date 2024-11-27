import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_ground/cart_bloc/cart_bloc.dart';
import 'package:testing_ground/cart_bloc/cart_event.dart';
import 'package:testing_ground/favorite_bloc/favorite_bloc.dart';
import 'package:testing_ground/favorite_bloc/favorite_event.dart';
import 'package:testing_ground/product_bloc/product_bloc.dart';
import 'package:testing_ground/product_bloc/product_event.dart';

class ProductDeletionBloc extends Bloc<ProductDeletionEvent, ProductDeletionState> {
  final ProductBloc productBloc;
  final FavoriteBloc favoriteBloc;
  final CartBloc cartBloc;

  ProductDeletionBloc({
    required this.productBloc,
    required this.favoriteBloc,
    required this.cartBloc,
  }) : super(ProductDeletionInitial()) {
    on<DeleteProductEvent>(_onDeleteProduct);
  }

  void _onDeleteProduct(DeleteProductEvent event, Emitter<ProductDeletionState> emit) {
    productBloc.add(RemoveProductEvent(productId: event.productId));
    favoriteBloc.add(RemoveFavoriteEvent(productId: event.productId));
    cartBloc.add(RemoveCartEvent(productId: event.productId));
    emit(ProductDeletionSuccess());
  }
}

// Events
abstract class ProductDeletionEvent {}

class DeleteProductEvent extends ProductDeletionEvent {
  final int productId;
  DeleteProductEvent({required this.productId});
}

// States
abstract class ProductDeletionState {}

class ProductDeletionInitial extends ProductDeletionState {}

class ProductDeletionSuccess extends ProductDeletionState {}
