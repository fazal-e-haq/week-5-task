import 'package:flutter/material.dart';
import 'package:login_app/Provides/auth_provider.dart';
import 'package:login_app/Screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: const LoginApp(),
    ),
  );
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: .dark(),
      themeMode: .dark,
      home: LoginScreen(),
    );
  }
}
