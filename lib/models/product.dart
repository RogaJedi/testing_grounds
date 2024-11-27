import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int productId;
  final String name;
  final String imageUrl;
  final String description;
  final int price;
  final int stock;

  const Product({
    required this.productId,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.stock,
  });

  Product copyWith({
    int? productId,
    String? name,
    String? imageUrl,
    String? description,
    int? price,
    int? stock,
  }) {
    return Product(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      price: price ?? this.price,
      stock: stock ?? this.stock,
    );
  }

  @override
  List<Object> get props => [productId, name, imageUrl, description, price, stock];
}
