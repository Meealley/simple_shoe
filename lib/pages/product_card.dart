import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    //  this.image,
  });
  // final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Card(
        color: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.epilogue(
                    textStyle:
                        const TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '\$$price',
                style: GoogleFonts.epilogue(textStyle: const TextStyle(fontSize: 23)),
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: Image(
                  image: AssetImage(
                    image,
                  ),
                  height: 170,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
