import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_ground/cart_bloc/cart_bloc.dart';
import 'package:testing_ground/cart_bloc/cart_event.dart';
import 'package:testing_ground/cart_bloc/cart_state.dart';
import '../favorite_bloc/favorite_bloc.dart';
import '../favorite_bloc/favorite_event.dart';
import '../favorite_bloc/favorite_state.dart';
import '../models/product.dart';

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
          BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              final isFavorite = state.favorites.any((f) => f.productId == product.productId);
              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  context.read<FavoriteBloc>().add(ToggleFavorite(product.productId));
                },
              );
            },
          ),
          BlocBuilder<CartBloc, CartState> (
            builder: (context, state) {
              return IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
                onPressed: () {
                  context.read<CartBloc>().add(RemoveCartEvent(product.productId));
                },
              );
            }
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              product.description,
              style: const TextStyle(color: Colors.black, fontSize: 30),
            ),
            const SizedBox(height: 20,),
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
    );
  }
}

/*
IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
 */