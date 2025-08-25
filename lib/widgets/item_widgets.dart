import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/list_model.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  final bool isCartItem;

  const ItemWidget({super.key, required this.item, this.isCartItem = false});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        leading: Image.network(item.imageUrl,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error),
            width: 50,
            height: 50,
            fit: BoxFit.cover),
        title: Text(item.name),
        subtitle: Text("\$${item.price.toStringAsFixed(2)}"),
        trailing: isCartItem
            ? IconButton(
                icon: const Icon(
                  Icons.remove_circle_outline_sharp,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  cart.removeItem(item);
                },
              )
            : IconButton(
                icon: const Icon(
                  Icons.add_shopping_cart_rounded,
                  color: Colors.green,
                ),
                onPressed: () {
                  cart.addItem(item);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${item.name} added to cart")),
                  );
                },
              ),
      ),
    );
  }
}
