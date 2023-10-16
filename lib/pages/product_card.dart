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
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Card(
        // color: Colors.amber,
        child: Column(
          children: [
            Text(title),
            SizedBox(
              height: 12,
            ),
            Text('\$$price'),
            SizedBox(
              height: 12,
            ),
            Image(
              image: AssetImage(
                image,
              ),
              height: 170,
            )
          ],
        ),
      ),
    );
  }
}
