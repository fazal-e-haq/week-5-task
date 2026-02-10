import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                  'W e l c o m e',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 100),
                loginField(
                  hintText: 'Email',
                  controller: emailController,
                  isobsure: false,
                ),
                SizedBox(height: 20),
                loginField(
                  hintText: 'Password',
                  controller: passwordController,
                  isobsure: true,
                ),
                SizedBox(height: 200),
                loginButton(context,emailController.text,passwordController.text),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector loginButton(BuildContext context,String email,String password) {
    return GestureDetector(
      onTap: (){



      },
      child: Container(
        padding: .all(9),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: .circular(10),
        ),
        child: Center(
          child: Text(
            'Login',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}

class loginField extends StatelessWidget {
  loginField({
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
