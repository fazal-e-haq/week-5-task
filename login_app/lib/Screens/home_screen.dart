import 'package:flutter/material.dart';
import 'package:login_app/Provides/auth_provider.dart';
import 'package:login_app/Screens/setting_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('H o m e'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingScreen()),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'User Email  :  ${context.watch<AuthProvider>().user?.email}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'User Password  :  ${context.watch<AuthProvider>().user?.password}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
