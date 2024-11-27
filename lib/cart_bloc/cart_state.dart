import 'package:equatable/equatable.dart';
import 'package:testing_ground/models/cart.dart';

class CartState extends Equatable {
  final List<Cart> carts;
  final int quantity;

  const CartState({required this.carts, required this.quantity});

  @override
  List<Object> get props => [carts, quantity];
}