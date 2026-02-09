import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/Provider/cart_provider.dart';
import 'package:shopping_cart_app/Provider/product_provider.dart';
import 'package:shopping_cart_app/Screens/home_screen.dart';

void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProductProvider(),),
      ChangeNotifierProvider(create: (context) => CartProvider(),),


    ],



      child: const ShoppingApp()));
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: .dark(),
      themeMode: .dark,
      home: HomeScreen(),
    );
  }
}
