import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_ground/api/cart_list.dart';
import 'package:testing_ground/cart_bloc/cart_bloc.dart';
import 'package:testing_ground/pages/profile_page.dart';
import 'package:testing_ground/product_bloc/product_bloc.dart';
import 'package:testing_ground/product_bloc/product_deletion_bloc.dart';
import 'favorite_bloc/favorite_bloc.dart';
import 'package:testing_ground/pages/cart_page.dart';
import 'api/product_list.dart';
import 'pages/favorite_page.dart';
import 'pages/home_page.dart';
import 'cubit/navigation_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(create: (context) => FavoriteBloc()),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => ProductBloc()),
        BlocProvider(create: (context) => ProductDeletionBloc(
          productBloc: context.read<ProductBloc>(),
          favoriteBloc: context.read<FavoriteBloc>(),
          cartBloc: context.read<CartBloc>(),
        )),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomePage(productList: ProductList.products),
      FavoritePage(
        productList: ProductList.products,
      ),
      CartPage(
          productList: ProductList.products,
      ),
      ProfilePage(),
    ];

    return BlocBuilder<NavigationCubit, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          body: _pages[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Главная',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Избранное',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Корзина',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                label: 'Профиль',
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: const Color(0xff504bff),
            unselectedItemColor: Colors.grey,
            onTap: (index) => context.read<NavigationCubit>().setPage(index),
          ),
        );
      },
    );
  }
}
