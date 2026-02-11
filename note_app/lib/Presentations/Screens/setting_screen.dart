import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: .symmetric(horizontal: 16),
          child: ListView(
            children: [
              ListTile(title: Text('data'), leading: Icon(Icons.light_mode),trailing: Icon(Icons.account_tree_outlined),),
            ],
          ),
        ),
      ),
    );
  }
}
