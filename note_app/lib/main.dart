import 'package:flutter/material.dart';
import 'package:note_app/Presentations/Screens/home_screen.dart';
import 'package:note_app/Providers/notes_provider.dart';
import 'package:provider/provider.dart';

import 'Core/Themes/dark_theme.dart';
import 'Core/Themes/light_theme.dart';

void main() {
  runApp(
    MultiProvider(
     providers: [
       ChangeNotifierProvider(create: (context) => NotesProvider(),)
       
     ],
      child: const NotesApp(),
    ),
  );
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: .dark,
      home:  HomeScreen(),
    );
  }
}
