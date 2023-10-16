import 'package:flutter/material.dart';
import 'package:simple_shoe_app/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow.shade300),
        inputDecorationTheme:
            InputDecorationTheme(prefixIconColor: Colors.grey),
      ),
      home: HomeScreen(),
    );
  }
}
