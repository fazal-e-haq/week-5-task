import 'package:flutter/material.dart';
import 'package:provider_basics_app/provider/counter_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  CounterProvider counterProvider = CounterProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'Counter : ${counterProvider.count}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: .end,
        crossAxisAlignment: .end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterProvider.incriment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {
              counterProvider.decriment();
            },
            child: Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
