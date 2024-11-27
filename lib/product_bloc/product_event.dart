import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class AddProductEvent extends ProductEvent {
  final int productId;

  const AddProductEvent({required this.productId});

  @override
  List<Object> get props => [productId];
}

class RemoveProductEvent extends ProductEvent {
  final int productId;

  const RemoveProductEvent({required this.productId});

  @override
  List<Object> get props => [productId];
}