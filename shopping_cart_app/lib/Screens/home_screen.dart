import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/Provider/cart_provider.dart';
import 'package:shopping_cart_app/Provider/product_provider.dart';
import 'package:shopping_cart_app/Screens/add_cart_screen.dart';
import 'package:shopping_cart_app/model/products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'P r o d u c t s',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 30),
              productsList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget productsList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: context.watch<ProductProvider>().products.length,
        itemBuilder: (context, index) {
          final product = context.watch<ProductProvider>().products[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(40),
                borderRadius: .circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Image.network(
                      fit: .fill,
                      width: 400,
                      height: 150,
                      product.image,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Name : ${product.product_name}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'Price : ${product.price}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: WidgetStateProperty.all(Size.fromWidth(400)),
                      ),
                      onPressed: () {
                        context.read<CartProvider>().addProduct(product);
                      },
                      child: Text('Add'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCartScreen()),
            );
          },
          icon: Icon(Icons.add_shopping_cart),
        ),
      ],
    );
  }
}
