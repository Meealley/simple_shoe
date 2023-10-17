import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_shoe_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(
              titleMedium: GoogleFonts.epilogue(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 20))),
          appBarTheme: AppBarTheme(
            titleTextStyle: const TextStyle(fontSize: 19, color: Colors.black),
            backgroundColor: Colors.grey.shade200,
            //  color: Colors.black,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow.shade300),
          inputDecorationTheme:
              const InputDecorationTheme(prefixIconColor: Colors.grey),
          useMaterial3: true,
        ),
        home: const HomeScreen());
  }
}
