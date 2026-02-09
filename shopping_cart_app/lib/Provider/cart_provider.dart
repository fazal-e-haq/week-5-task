import 'package:flutter/material.dart';

import '../model/products.dart';

class CartProvider extends ChangeNotifier{

  List<Products> addedProductList = [];

  void addProduct(Products product) {
    addedProductList.add(product);
    notifyListeners();
  }

  void removeProduct(int index) {
    addedProductList.removeAt(index);
    notifyListeners();
  }



}