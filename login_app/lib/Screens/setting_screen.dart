import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provides/auth_provider.dart';
import 'login_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  TextEditingController newEmailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  void dispose() {
    newEmailController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('S e t t i n g')),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: Text('L o g o u t'),
              onTap: () {
                context.read<AuthProvider>().logout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              leading: Icon(Icons.logout),
            ),
            ListTile(
              title: Text('C h a n g e    E m a i l'),
              onTap: () {
                dialog(
                  context,
                  newEmailController.text,
                  newEmailController,
                  () {
                    context.read<AuthProvider>().setEmail(
                      newEmailController.text,
                    );
                    Navigator.pop(context);
                  },
                );
              },
              leading: Icon(Icons.email),
            ),
            ListTile(
              title: Text('C h a n g e    P a s s w o r d'),
              onTap: () {
                dialog(
                  context,
                  newPasswordController.text,
                  newPasswordController,
                  () {
                    context.read<AuthProvider>().setEmail(
                      newEmailController.text,
                    );
                    Navigator.pop(context);
                  },
                );
              },
              leading: Icon(Icons.password),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> dialog(
    BuildContext context,
    String changingValue,
    TextEditingController controller,
    void Function()? onPressed,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: .all(20),
          child: Column(
            children: [
              TextFormField(controller: controller),
              Row(
                mainAxisAlignment: .end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cencle'),
                  ),
                  TextButton(onPressed: onPressed, child: Text('Confirm')),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
