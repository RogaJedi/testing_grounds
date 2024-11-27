import 'package:equatable/equatable.dart';
import 'package:testing_ground/models/product.dart';

class ProductState extends Equatable {
  final List<Product> products;

  ProductState({required this.products});

  @override
  List<Object> get props => [products];
}