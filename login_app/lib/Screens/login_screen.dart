import 'package:flutter/material.dart';
import 'package:login_app/Provides/auth_provider.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('L o g i n')),
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: .symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: .center,
              children: [
                Text(
                  'W e l c o m e\nB a c k',
                  textAlign: .center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 100),
                LoginField(
                  hintText: 'Email',
                  controller: emailController,
                  isobsure: false,
                ),
                SizedBox(height: 20),
                LoginField(
                  hintText: 'Password',
                  controller: passwordController,
                  isobsure: true,
                ),
                SizedBox(height: 200),
                loginButton(context),

                // for check if user has data or not
                //
                // TextButton(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => HomeScreen()),
                //     );
                //   },
                //   child: Text('Home Screen'),
                // ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector loginButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AuthProvider>().login(
          emailController.text,
          passwordController.text,
        );

        if (context.read<AuthProvider>().isloggedIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      },
      child: Container(
        padding: .all(9),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: .circular(10),
        ),
        child: Center(
          child: context.watch<AuthProvider>().isloggedIn
              ? CircularProgressIndicator()
              : Text('Login', style: Theme.of(context).textTheme.headlineSmall),
        ),
      ),
    );
  }
}

class LoginField extends StatelessWidget {
  LoginField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isobsure,
  });
  String hintText = '';
  TextEditingController controller;
  bool isobsure = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isobsure,
      decoration: InputDecoration(
        hintText: hintText,

        enabledBorder: OutlineInputBorder(
          borderRadius: .circular(10),
          borderSide: BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: .circular(10),
          borderSide: BorderSide(color: Colors.white54),
        ),
      ),
    );
  }
}
