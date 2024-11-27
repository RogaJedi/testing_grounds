import 'package:testing_ground/models/product.dart';

class ProductList {
  static final List<Product> _products = [
    const Product(
      productId: 0,
      name: 'One',
      imageUrl: 'image_url',
      description: 'Product number one',
      price: 100,
      stock: 10,
    ),
    const Product(
      productId: 1,
      name: 'Two',
      imageUrl: 'image_url',
      description: 'Product number two',
      price: 200,
      stock: 10,
    ),
    const Product(
      productId: 2,
      name: 'Three',
      imageUrl: 'image_url',
      description: 'Product number three',
      price: 300,
      stock: 10,
    ),
    const Product(
      productId: 3,
      name: 'Four',
      imageUrl: 'image_url',
      description: 'Product number four',
      price: 400,
      stock: 10,
    ),
  ];

  static List<Product> get products => _products;

  static void addProduct(Product product) {
    if (!_products.any((p) => p.productId == product.productId)) {
      _products.add(product);
    }
  }

  static void removeProduct(int productId) {
    _products.removeWhere((p) => p.productId == productId);
  }

  static void editProduct({
    required int productId,
    required String name,
    required String imageUrl,
    required String description,
    required int price,
    required int stock,
  }) {
    final index = _products.indexWhere((p) => p.productId == productId);
    if (index != -1) {
      _products[index] = _products[index].copyWith(
        name: name,
        imageUrl: imageUrl,
        description: description,
        price: price,
        stock: stock,
      );
    }
  }
}