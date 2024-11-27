import 'package:flutter/material.dart';
import 'package:testing_ground/models/product.dart';
import 'package:testing_ground/widgets/product_card.dart';

class HomePage extends StatelessWidget {

  final List<Product> productList;

  const HomePage({
    super.key,
    required this.productList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Главная"),
      ),
      body: Stack(
        children: [
          GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: productList.length,
            itemBuilder: (BuildContext context, int index) {
              final product = productList[index];
              return ProductCard(product: product);
            },
          ),
          Positioned(
              bottom: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 60,
                  width: 60,
                  child: const Center(
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              )
          ),
        ],
      )
    );
  }


}