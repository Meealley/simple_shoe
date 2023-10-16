import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> filters = const [
    "All",
    "Addidas",
    "Reebok",
    "Balenciaga",
    "Nike"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                      child: Chip(
                        padding: EdgeInsets.all(10),
                        label: Text(
                          filter,
                          style: GoogleFonts.epilogue(
                              textStyle: TextStyle(
                            fontSize: 16,
                          )),
                        ),
                      ),
                    );
                  },
                  itemCount: filters.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
