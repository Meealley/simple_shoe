import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Favourite page",
              style: GoogleFonts.epilogue(
                  textStyle:
                      const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
