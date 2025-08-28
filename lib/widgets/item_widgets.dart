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

    return SingleChildScrollView(
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 130,
                  child: Stack(
                    alignment:AlignmentGeometry.topRight ,
                    fit: StackFit.expand,
                    clipBehavior: Clip.hardEdge,
                    children: [
                      Image.network(item.imageUrl,
                          errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                          fit: BoxFit.cover),
                      if (isCartItem)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: const Icon(
                              Icons.clear_sharp,
                              color: Colors.red,
                              size: 30,
                            ),
                            onPressed: () {
                              cart.deleteItem(item);
                            },
                            tooltip: "Remove from cart",
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    item.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "\$${item.price.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: isCartItem
                      ? Container(
                          height: 40,
                          width: double.infinity,
                          margin: const EdgeInsets.only(right: 8, bottom: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.remove_circle_outline_sharp,
                                  color: Colors.redAccent,
                                ),
                                onPressed: () {
                                  cart.removeItem(item);
                                },
                                tooltip: "Remove item",
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.green,
                                ),
                                onPressed: () {
                                  cart.addItem(item);
                                },
                                tooltip: "Add item",
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "${cart.getItemQuantity(item)} ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Items",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          width: 110,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(10),
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Add to Cart ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    )),
                                const Icon(Icons.add_shopping_cart_sharp,
                                    color: Colors.white, size: 20)
                              ],
                            ),
                            onPressed: () {
                              cart.addItem(item);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text("${item.name} added to cart")),
                              );
                            },
                          ),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemGrid extends StatelessWidget {
  final List<Item> items;
  final bool isCart;

  const ItemGrid({super.key, required this.items, this.isCart = false});

  @override
  Widget build(BuildContext context) {
    final uniqueItems = {
      for (var item in items) item.name: item,
    }.values.toList();

    final displayItems = isCart ? uniqueItems : uniqueItems.take(2).toList();

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: displayItems.length,
      itemBuilder: (context, index) {
        final item = displayItems[index];
        return ItemWidget(item: item, isCartItem: isCart);
      },
    );
  }
}
