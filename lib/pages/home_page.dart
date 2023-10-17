import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_shoe_app/pages/cart_page.dart';
import 'package:simple_shoe_app/pages/favorite_page.dart';
import 'package:simple_shoe_app/pages/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [
    const ProductList(),
    const FavoritePage(),
    const CartPage()
  ];
  int currentPage = 0;

  // Define your individual pages or screens here.
  // final List<Widget> _pages = [

  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: Colors.blue.shade400),
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        selectedLabelStyle:
            GoogleFonts.epilogue(textStyle: const TextStyle(fontSize: 15)),
        // backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: '',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_sharp,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
