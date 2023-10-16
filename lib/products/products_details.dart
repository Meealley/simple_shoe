import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Map<String, Object> product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: GoogleFonts.epilogue(),
        ),
      ),
      body: Column(
        children: [
          Text(product['title'] as String,
              style: Theme.of(context).textTheme.titleMedium),
          const Spacer(),
          Image.asset(product['imageUrl'] as String),
          const Spacer(
            flex: 3,
          ),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  '\$${product['price']}',
                  style: GoogleFonts.epilogue(
                      textStyle:
                          const TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size = (product['sizes'] as List<int>)[index];

                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Chip(
                          label: Text(
                            size.toString(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(
                        Size(double.infinity, 50),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Add to cart',
                      style: GoogleFonts.epilogue(
                          textStyle: const TextStyle(fontSize: 17)),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
