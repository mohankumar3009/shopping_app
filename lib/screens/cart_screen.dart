import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/widgets/item_widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: const Text("Cart", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.amberAccent,
      ),
      body: Consumer<CartProvider>(
        builder: (context, provider, child) => Column(
          children: [
            Expanded(
              child: provider.cartItems.isEmpty
                  ? const Center(
                      child: Text(
                        "Your cart is empty please provide the cart items and continue shopping.",
                        style: TextStyle(
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: provider.cartItems.length,
                      itemBuilder: (context, index) => ItemWidget(
                        isCartItem: true,
                        item: provider.cartItems[index],
                      ),
                    ),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 38, 143, 42),
              ),
              onPressed: provider.cartItems.isEmpty
                  ? null
                  : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Purchased items for \$${provider.totalPrice}",
                          ),
                        ),
                      );
                      provider.clearCart();
                    },
              child: Text(
                "Buy \$${provider.totalPrice.toStringAsFixed(2)}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
