import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int productId;
  final String name;
  final String imageUrl;
  final String description;
  final int price;
  late final int stock;

  Product({
    required this.productId,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.stock,
  });

  @override
  List<Object> get props => [productId, name, imageUrl, description, price, stock];
}