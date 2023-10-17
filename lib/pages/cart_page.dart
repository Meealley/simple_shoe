import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_shoe_app/pages/cart_provider.dart';
// import 'package:simple_shoe_app/pages/global_variable.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
      ),
      body: cart.isEmpty
          ? Center(
              child: Text(
                "Cart Item is empty 🙀, Please add an Item",
                style: GoogleFonts.epilogue(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final cartItem = cart[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage(cartItem['imageUrl'].toString()),
                    radius: 30,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.red.shade100,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              title: Text(
                                "Delete Product",
                                style: GoogleFonts.epilogue(
                                    textStyle:
                                        const TextStyle(fontWeight: FontWeight.w500)),
                              ),
                              content: Text(
                                "Please ensure that you know what you want before deleting",
                                style: GoogleFonts.epilogue(
                                    textStyle: const TextStyle(fontSize: 18)),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Provider.of<CartProvider>(context,
                                              listen: false)
                                          .removeProduct(cartItem);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Yes",
                                      style: GoogleFonts.epilogue(
                                          textStyle: const TextStyle(
                                              fontSize: 16, color: Colors.red)),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "No",
                                      style: GoogleFonts.epilogue(
                                          textStyle: const TextStyle(fontSize: 16)),
                                    )),
                              ],
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  title: Text(
                    cartItem['title'].toString(),
                    style: GoogleFonts.epilogue(),
                  ),
                  subtitle: Text('Size: ${cartItem['size']}'),
                );
              },
            ),
    );
  }
}
