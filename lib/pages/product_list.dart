import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_shoe_app/pages/global_variable.dart';
import 'package:simple_shoe_app/pages/product_card.dart';
import 'package:simple_shoe_app/products/products_details.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    "All",
    "Addidas",
    "Reebok",
    "Balenciaga",
    "Nike"
  ];
  late String selectedfilters;

  @override
  void initState() {
    super.initState();
    selectedfilters = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Shoes \nCollections",
                  style: GoogleFonts.epilogue(
                    textStyle: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 21,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: GoogleFonts.epilogue(
                          textStyle: const TextStyle(fontSize: 18)),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 28,
                      ),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedfilters = filter;
                        });
                      },
                      child: Chip(
                        padding: const EdgeInsets.all(10),
                        backgroundColor: selectedfilters == filter
                            ? Colors.amber
                            : Colors.blue.shade100,
                        label: Text(
                          filter,
                          style: GoogleFonts.epilogue(
                              textStyle: const TextStyle(
                            fontSize: 16,
                          )),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: filters.length,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: ((context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) {
                            return ProductDetailsPage(product: product);
                          }),
                        ),
                      );
                    },
                    child: ProductCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] as String,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
