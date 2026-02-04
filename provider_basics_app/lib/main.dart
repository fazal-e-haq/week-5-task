import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basics_app/provider/counter_provider.dart';
import 'package:provider_basics_app/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),

      ],
      child: CounterApp(),
    ),
  );
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: HomeScreen(),
    );
  }
}
