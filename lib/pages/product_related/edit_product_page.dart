import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_ground/api/product_list.dart';
import 'package:testing_ground/product_bloc/product_bloc.dart';
import 'package:testing_ground/product_bloc/product_event.dart';
import 'package:testing_ground/product_bloc/product_state.dart';

//TODO: MAYBE CHANGE THIS TO USE BLOC INSTEAD

class EditProductPage extends StatefulWidget {
  final int productId;

  EditProductPage({required this.productId});

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late TextEditingController _controllerName;
  late TextEditingController _controllerImage;
  late TextEditingController _controllerDescription;
  late TextEditingController _controllerPrice;
  late TextEditingController _controllerStock;

  @override
  void initState() {
    super.initState();
    // Fetch the existing product
    final product = ProductList.products.firstWhere((p) => p.productId == widget.productId);

    // Initialize controllers with existing data
    _controllerName = TextEditingController(text: product.name);
    _controllerImage = TextEditingController(text: product.imageUrl);
    _controllerDescription = TextEditingController(text: product.description);
    _controllerPrice = TextEditingController(text: product.price.toString());
    _controllerStock = TextEditingController(text: product.stock.toString());
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is removed
    _controllerName.dispose();
    _controllerImage.dispose();
    _controllerDescription.dispose();
    _controllerPrice.dispose();
    _controllerStock.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Редактировать позицию'),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                TextField(
                  controller: _controllerName,
                  decoration: const InputDecoration(labelText: 'Название'),
                ),
                TextField(
                  controller: _controllerImage,
                  decoration: const InputDecoration(labelText: 'Изображение в формате URL'),
                ),
                TextField(
                  controller: _controllerDescription,
                  decoration: const InputDecoration(labelText: 'Описание'),
                ),
                TextField(
                  controller: _controllerPrice,
                  decoration: const InputDecoration(labelText: 'Стоимость'),
                ),
                TextField(
                  controller: _controllerStock,
                  decoration: const InputDecoration(labelText: 'Количество'),
                ),
              ],
            ),
            BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  return Positioned(
                    bottom: 50,
                    left: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<ProductBloc>().add(
                            EditProductEvent(
                                productId: widget.productId,
                                name: _controllerName.text,
                                imageUrl: _controllerImage.text,
                                description: _controllerDescription.text,
                                price: int.parse(_controllerPrice.text),
                                stock: int.parse(_controllerStock.text)
                            )
                        );
                        Navigator.pop(context);
                      },
                      child: const Text('Сохранить'),
                    ),
                  );
                }
            )
          ],
        )
    );
  }
}
