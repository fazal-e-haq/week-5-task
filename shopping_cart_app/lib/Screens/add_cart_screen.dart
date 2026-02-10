import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/Provider/cart_provider.dart';
import 'package:shopping_cart_app/model/products.dart';

import '../Provider/product_provider.dart';

class AddCartScreen extends StatelessWidget {
  AddCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: .symmetric(horizontal: 16),
          child: ListView.builder(
            itemCount: context.watch<CartProvider>().addedProductList.length,
            itemBuilder: (context, index) {
              final product = context
                  .watch<CartProvider>()
                  .addedProductList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: .circular(20),
                  ),
                  padding: .all(5),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Image.network(product.image, width: 80),
                        SizedBox(width: 10),
                        Text(
                          'Name : ${product.product_name}\nProce : ${product.price}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(width: 100),
                        IconButton(
                          onPressed: () {
                            context.read<CartProvider>().removeProduct(index);
                          },
                          icon: Icon(Icons.remove, color: Colors.red, size: 35),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'C h e c k o u t',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 100),

                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            'Total items ',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: .start,
                          ),
                          Text(
                            context
                                .watch<CartProvider>()
                                .addedProductList
                                .length
                                .toString(),
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: .start,
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            'Total Price ',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: .start,
                          ),
                          Text(
                            'Rs ${ context.watch<CartProvider>().totalPrice}',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: .start,
                          ),
                        ],
                      ),

                      SizedBox(height: 200),

                      ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: WidgetStatePropertyAll(
                            .fromWidth(double.maxFinite),
                          ),
                        ),
                        onPressed: () {},
                        child: Text('Confirm Order'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
