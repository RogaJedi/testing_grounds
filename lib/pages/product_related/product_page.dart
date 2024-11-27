import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_ground/cart_bloc/cart_bloc.dart';
import 'package:testing_ground/cart_bloc/cart_event.dart';
import 'package:testing_ground/cart_bloc/cart_state.dart';
import 'package:testing_ground/pages/product_related/edit_product_page.dart';
import 'package:testing_ground/product_bloc/product_deletion_bloc.dart';
import '../../favorite_bloc/favorite_bloc.dart';
import '../../favorite_bloc/favorite_event.dart';
import '../../favorite_bloc/favorite_state.dart';
import '../../models/product.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  ProductPage({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => EditProductPage(productId: product.productId))),
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
              )
          ),
          BlocBuilder<ProductDeletionBloc, ProductDeletionState>(
              builder: (context, state) {
                return IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    context.read<ProductDeletionBloc>().add(DeleteProductEvent(productId: product.productId));
                    Navigator.pop(context);
                  },
                );
              }
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned(
              top: 10,
              right: 10,
              child: BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  final isFavorite = state.favorites.any((f) => f.productId == product.productId);
                  return IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      context.read<FavoriteBloc>().add(ToggleFavoriteEvent(product.productId));
                    },
                  );
                },
              ),
          ),
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.imageUrl,
                    style: const TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    product.description,
                    style: const TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    product.price.toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    product.productId.toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<CartBloc, CartState> (
                      builder: (context, state) {
                        final isAdded = state.carts.any((c) => c.productId == product.productId);
                        return ElevatedButton(
                          onPressed: () {
                            context.read<CartBloc>().add(AddCartEvent(product.productId));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isAdded ? Colors.white : Colors.blue,
                            minimumSize: const Size(200, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            isAdded ? 'Item added' : 'Add to cart',
                            style: TextStyle(
                              color: isAdded ? Colors.blue : Colors.white,
                            ),
                          ),
                        );
                      }
                  ),
                ],
              )
          ),
        ],
      )
    );
  }
}

/*
BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              final isFavorite = state.favorites.any((f) => f.productId == product.productId);
              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  context.read<FavoriteBloc>().add(ToggleFavoriteEvent(product.productId));
                },
              );
            },
          ),
 */