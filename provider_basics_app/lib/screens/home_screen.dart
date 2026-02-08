import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basics_app/provider/counter_provider.dart';
import 'package:provider_basics_app/provider/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch.adaptive(
            padding: .symmetric(horizontal: 20),
            value: context.watch<ThemeProvider>().themechange(),
            onChanged: (value) {
              context.read<ThemeProvider>().toggle(value);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Consumer(
            builder: (cntx, value, child) {
              return Text(
                'Counter : ${cntx.watch<CounterProvider>().count}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            },

          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: .end,
        crossAxisAlignment: .end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterProvider>().incriment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterProvider>().decriment();
            },
            child: Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
