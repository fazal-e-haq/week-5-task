import 'package:flutter/material.dart';
import 'package:shopping_cart_app/model/products.dart';

class ProductProvider extends ChangeNotifier {
  List<Products> products = [
    Products(
      image:
          'https://img.freepik.com/free-photo/fresh-orange-juice-glass-dark-background_1150-45560.jpg?semt=ais_hybrid&w=740&q=80',
      product_name: 'Juice',
      price: 50,
    ),
    Products(
      image:
          'https://plus.unsplash.com/premium_photo-1725075086083-89117890371d?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y29sZCUyMGRyaW5rfGVufDB8fDB8fHww',
      product_name: 'Drink',
      price: 200,
    ),
    Products(
      image:
          'https://cdn.britannica.com/77/200377-050-4326767F/milk-splashing-glass.jpg',
      product_name: 'Milk',
      price: 200,
    ),
    Products(
      image:
          'https://t4.ftcdn.net/jpg/01/86/75/77/360_F_186757743_lJoYBOm6kafQNKMi3FkXVkkrrbaNvgfX.jpg',
      product_name: 'Beef',
      price: 1500,
    ),
    Products(
      image:
          'https://img.freepik.com/free-psd/3d-illustration-with-cleaning-essentials_23-2151328293.jpg?semt=ais_hybrid&w=740&q=80',
      product_name: 'Soap',
      price: 70,
    ),
    Products(
      image:
          'https://www.shutterstock.com/image-photo/white-tea-cup-refreshing-hot-600nw-2461982285.jpg',
      product_name: 'Tea',
      price: 10,
    ),
  ];

  void removeProduct(Products product) {
    products.remove(product);
    notifyListeners();
  }

  void addProduct(Products product) {
    products.add(product);
    notifyListeners();
  }
}
